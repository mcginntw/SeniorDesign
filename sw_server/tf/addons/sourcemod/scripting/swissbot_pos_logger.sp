#include <sourcemod>
#include <sdktools>

public Plugin myinfo =
{
    name        = "SWISSBOT Position Logger",
    author      = "Tristan M",
    description = "logs bot positions",
    version     = "1.2"
};

Handle g_Timer = null;

public void OnPluginStart()
{
    g_Timer = CreateTimer(1.0, LogBotPositions, TIMER_REPEAT | TIMER_FLAG_NO_MAPCHANGE);
    PrintToServer("[SWISSBOT] Bot position logger started.");
}

public Action LogBotPositions(Handle timer)
{
    int maxClients = MaxClients;
    for (int i = 1; i <= maxClients; i++)
    {
        if (!IsClientInGame(i) || !IsFakeClient(i))
        {
            continue;
        }
        float pos[3];
        GetClientAbsOrigin(i, pos);
        char name[64];
        GetClientName(i, name, sizeof(name));

        PrintToServer("[RCBOTPOS] %s | pos: %.2f %.2f %.2f", name, pos[0], pos[1], pos[2]);
    }

    return Plugin_Continue;
}