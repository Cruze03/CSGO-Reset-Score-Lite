#include <cstrike>
#include <multicolors>
 
#pragma semicolon 1
#pragma newdecls required

 
public Plugin myinfo =
{
    name	=	"ResetScore Lite",
    author	=	"STEAM_0:1:86329553",
    version	=	"1.0",
    url		=	""
};
public void OnPluginStart() 
{
	ServerCommand("mp_backup_round_file \"\"");
	ServerCommand("mp_backup_round_file_last \"\"");
	ServerCommand("mp_backup_round_file_pattern \"\"");
	ServerCommand("mp_backup_round_auto 0");
}

public void OnMapStart()
{
	ServerCommand("mp_backup_round_file \"\"");
	ServerCommand("mp_backup_round_file_last \"\"");
	ServerCommand("mp_backup_round_file_pattern \"\"");
	ServerCommand("mp_backup_round_auto 0");
}

public void OnClientSayCommand_Post(int client, const char[] command, const char[] sArgs)
{
    if (strcmp(sArgs, "rs", false) == 0 || strcmp(sArgs, "resetscore", false) == 0 || strcmp(sArgs, "!rs", false) == 0 || strcmp(sArgs, "!resetscore", false) == 0)
    {
        if (GetClientDeaths(client) || CS_GetClientContributionScore(client))
        {
            SetEntProp(client, Prop_Data, "m_iDeaths", 0);
            SetEntProp(client, Prop_Data, "m_iFrags", 0);
            CS_SetClientAssists(client, 0);
            CS_SetMVPCount(client, 0);
            CS_SetClientContributionScore(client, 0);
            CPrintToChat(client, "{GREEN}[RS] {DEFAULT}You have reset your score!");
        }
        else CPrintToChat(client, "{GREEN}[RS] {DEFAULT}Your Score is already 0!");
    }
	return Plugin_Continue;
}