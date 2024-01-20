return {
    "rcarriga/nvim-notify",
    opts = {
        background_colour = '#000000',
        timeout = 1000
    },
    config = function(_, opts)
        require('notify').setup(opts)
    end,
    kyes = {
        {'<esc>', function() require('notify').dismiss({silent = true, pending = true}) end, desc = 'dismiss all notifications'},
    }
}
