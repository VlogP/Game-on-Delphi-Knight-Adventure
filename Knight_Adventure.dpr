program Knight_Adventure;

uses
  Forms,
  Game in 'Game.pas' {GameForm},
  MapLevel in 'MapLevel.pas',
  MapControl in 'MapControl.pas',
  Enemy in 'Enemy.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TGameForm, GameForm);
  Application.Run;
end.         
