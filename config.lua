_CONFIG = 
{
    locale = "de",
    syncIntervalMinutes = 1, -- snyc database every 60 seconds. results in 60 seconds roll-back if client or server connection is interrupted. 
                             -- higher values risk higher roll-back, lower values may result in server thread hitch.

    Commands = 
    {
        setvisa = -- Overwrite a players visa stage.
                  -- Usage: /setvisa <id> <visaStage>
                  -- Example: /setvisa 1 3 
        {
            enabled = true,
            name = "setvisa",
            permissions = {"admin", "moderator"}
        }
    },

    visaStages =
    {
        {
            requiredPlayTimeMinutes = 60,
            label = "Visa Stage I"
        },
        {
            requiredPlayTimeMinutes = 300,
            label = "Visa Stage II"
        },
        {
            requiredPlayTimeMinutes = 720,
            label = "Visa Stage III"
        }
    }
}

if (not IsDuplicityVersion()) then
    -- Notify event. Can be replaced.
    ---@param message string Message to be displayed for the notify.
    ---@param type string Notify type. Either success or errror.
    RegisterNetEvent("5d-visa:notify", function(message, type)
        ESX.ShowNotification(message)
    end)
end

_LOCALE = {} -- dont touch