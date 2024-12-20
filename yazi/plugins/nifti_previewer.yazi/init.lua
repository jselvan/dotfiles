local M = {}

function M:peek()
    if self:preload() == 1 then
        local cache = ya.file_cache(self)
        if cache and fs.cha(cache).length > 0 then
            image_height = ya.image_show(cache, self.area).h
        end
    end
end

function M:seek(units)
    local h = cx.active.current.hovered
    if h and h.url == self.file.url then
        local step = math.floor(units * self.area.h / 10)
        ya.manager_emit("peek", {
            math.max(0, cx.active.preview.skip+step),
            only_if=self.file_url
        })
    end
end

function M:preload()
    local cache = ya.file_cache(self)
    if not cache or fs.cha(cache) then
        return 1
    end

    local python = os.getenv("PYTHON")
    local script = os.getenv("YAZI_CONFIG_HOME") .. "/scripts/nifti2png.py"
    local child, code = Command(python)
        :args({
            script,
            tostring(self.file.url),
            tostring(cache)
        })
        :stdout(Command.PIPED)
        :stderr(Command.PIPED)
        :spawn()

    if not child then
        ya.err(string.format("spawn `%s` command returns %s", cmd, code))
        return 0
    end
    local output, err = child:wait_with_output()
    ya.err(output.stdout)
    ya.err(output.stderr)
end

return M
