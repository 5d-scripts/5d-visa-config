_CONFIG = 
{
    syncIntervalMinutes = 1, -- snyc database every 60 seconds. results in 60 seconds roll-back if client or server connection is interrupted. 
                             -- higher values risk higher roll-back, lower values may result in server thread hitch.

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
