let
  primaryName = builtins.getEnv "PRIMARYNAME";
  primaryMail = builtins.getEnv "PRIMARYMAIL";
  secondaryName = builtins.getEnv "SECONDARYNAME";
  secondaryMail = builtins.getEnv "SECONDARYMAIL";
in
{
  people = {
    primary = {
      name = if primaryName != "" then primaryName else "";
      mail = if primaryMail != "" then primaryMail else "";
    };
    secondary = {
      name = if secondaryName != "" then secondaryName else "";
      mail = if secondaryMail != "" then secondaryMail else "";
    };
  };
}
