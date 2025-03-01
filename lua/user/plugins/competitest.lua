local function sanitize(str)
    -- Replace non-alphanumeric characters with _
    str = str:gsub("[^%w]", "_")
    -- Replace multiple _ with a single _
    str = str:gsub("_+", "_")
    return str
end
return {
    "xeluxee/competitest.nvim",
    dependencies = "MunifTanjim/nui.nvim",
    config = function()
        local cphome = vim.loop.os_homedir() .. "/CP"
        local inlcude_path = string.format("-I%s/include", cphome)
        require("competitest").setup({
            compile_command = {
                cpp = {
                    exec = "c++",
                    args = { "-Wall", "-std=c++17", "-Wextra", "-DDEBUG", inlcude_path, "$(FNAME)", "-o", "$(FNOEXT)" },
                },
            },
            testcases_directory = "./tests",
            received_problems_path = function(task, file_extension)
                local hyphen = string.find(task.group, " - ")
                local judge, contest
                if not hyphen then
                    judge = task.group
                    contest = "random"
                else
                    judge = string.sub(task.group, 1, hyphen - 1)
                    contest = string.sub(task.group, hyphen + 3)
                end
                contest = sanitize(contest)
                local problem_name = sanitize(task.name)
                judge = sanitize(judge)
                return string.format("%s/%s/%s.%s", cphome, judge, problem_name, file_extension)
            end,
            received_contests_problems_path = function(task, file_extension)
                local problem_name = sanitize(task.name)
                return problem_name .. "." .. file_extension
            end,
            received_contests_directory = function(task, file_extension)
                local hyphen = string.find(task.group, " - ")
                local judge
                if not hyphen then
                    judge = task.group
                else
                    judge = string.sub(task.group, 1, hyphen - 1)
                end
                judge = sanitize(judge)
                return string.format("%s/CP/%s", cphome, judge)
            end,

            popup_ui = {
                total_width = 0.9,
                total_height = 1.0,
                layout = {
                    { 1, "tc" },
                    {
                        3,
                        {
                            { 1, "so" },
                            { 1, "si" },
                        },
                    },
                    {
                        3,
                        {
                            { 1, "eo" },
                            { 1, "se" },
                        },
                    },
                },
            },
        })
    end,
}
