unit Game;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls,Clipbrd, StdCtrls, Buttons,Maplevel,MapControl,Enemy;

type


  TGameForm = class(TForm)
    Timer2: TTimer;
    Timer1: TTimer;


    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);



    { Private declarations }
  public
    { Public declarations }
  end;
  type
Filesave = record
SaveX,SaveY,SaveLoc,SaveTimePlayer,SaveHp,SavePosition,SavePositionShot,SavepasswordI:integer;
Savexs,Saveys:array[1..4] of integer;
SavePassword:string[50];
SaveKey,SaveDoorsost:boolean;
end;

  var
  GameForm: TGameForm;
  SaveData:Filesave;
  SavePoint:File of Filesave;
  Pers:array[1..20] of Tbitmap;


  nomer,n,xp,yp,positionp,i,HP,TimerPlayer,passwordI:integer;
  Save_Load_Time,locshot:byte;
  HodPlayer,AnimShot,SaveFlag,LoadFlag,SostText:boolean;
  Password:string;
  implementation
procedure hod(i,n:integer);

begin
for i:=i to n do
  begin
  Pers[i]:=TBitmap.Create;
  Pers[i].LoadFromFile('Characters\'+intToStr(i)+ '.bmp');
  Pers[i].Transparent:=true;
  Pers[i].TransparentMode:=tmauto;
 end;
 end;
procedure animhod;
begin
 if HodPlayer  then
 begin
 if nomer mod 2 = 0 then
 buf.Canvas.Draw(x,y, pers[positionp+1]);
 if nomer mod 2 <> 0 then
 buf.Canvas.Draw(x,y, pers[positionp+2]);
 end
 else
 buf.Canvas.Draw(x,y, pers[positionp]);
 end;

 procedure InterfaceDraw;
begin
Buf.canvas.font.Style:=[fsbold];
Buf.canvas.pen.width:=1;
Buf.Canvas.Brush.Style:=bsclear;

If (saveflag)  then
begin
Buf.canvas.font.Size:=50;
Buf.Canvas.font.Name:='Monotype Corsiva';
Buf.canvas.font.color:=clLime;
buf.Canvas.TextOut(600,60,'Save');
end;
If (loadflag)  then
begin
Buf.canvas.font.Size:=50;
Buf.Canvas.font.Name:='Monotype Corsiva';
Buf.canvas.font.color:=clLime;
buf.Canvas.TextOut(600,60,'Load');
end;
Buf.canvas.font.Size:=20;
Buf.Canvas.font.Name:='Bernard MT Condensed';
Buf.canvas.font.color:=clGradientInactiveCaption;
buf.Canvas.TextOut(1240,0,'Location:'+inttostr(loc));

Buf.canvas.font.color:=rgb(30,255,255);;
buf.Canvas.TextOut(630,0,'TIME:'+ inttostr(Timerplayer));
Buf.canvas.font.color:=clRed;
Buf.canvas.font.Size:=17;
Buf.Canvas.font.Name:='Arial';
buf.Canvas.TextOut(85,720,'HP '+ inttostr(hp));
Buf.canvas.Brush.Color:=clRed;
Buf.canvas.pen.Style:=psClear;
Buf.canvas.RoundRect(20,750,hp*2+20,760,2,2);
Buf.Canvas.Brush.Style:=bsclear;
Buf.canvas.pen.color:=clWhite;
Buf.canvas.pen.Style:=psSolid;
Buf.canvas.RoundRect(220,750,20,760,2,2);



end;
   procedure StartMessage;
begin
   Buf.canvas.font.Size:=120;
  Buf.Canvas.Brush.Style:=bsclear;
  Buf.Canvas.font.Name:='Bernard MT Condensed';
  Buf.canvas.font.color:=clRed;
  buf.Canvas.TextOut(350,200 ,'Kill the Boss');
end;


 {$R *.dfm}
procedure Positions_Players_And_Shot( i,n:integer);
begin
if control=true then
      sost:=n;
    positionp:=i;
    positionShot:=n;
    nomer:=nomer+1;
    HodPlayer:=true;
end;

procedure GameOverInterface;
begin
Buf.Canvas.font.Name:='Bernard MT Condensed';
Buf.canvas.font.Size:=120;
Buf.Canvas.Brush.Style:=bsclear;
Buf.Canvas.font.Name:='Bernard MT Condensed';
Buf.canvas.font.color:=clRed;
buf.Canvas.TextOut(350,200 ,'GAME OVER');
Buf.canvas.font.color:=clWhite;
Buf.canvas.font.Size:=20;
buf.Canvas.TextOut(600,360,'Press (ESC) to exit');
end;

procedure VictoryInterface;
begin
Buf.Canvas.font.Name:='Bernard MT Condensed';
Buf.canvas.font.Size:=120;
Buf.Canvas.Brush.Style:=bsclear;
Buf.Canvas.font.Name:='Bernard MT Condensed';
Buf.canvas.font.color:=clBlue;
buf.Canvas.TextOut(450,200 ,'WINNER');
Buf.canvas.font.Size:=60;
Buf.canvas.font.color:=rgb(30,255,255);;
buf.Canvas.TextOut(500,360 ,'Your time:'+inttoStr(timerplayer));
Buf.canvas.font.color:=clWhite;
Buf.canvas.font.Size:=20;
buf.Canvas.TextOut(600,450,'Press (ESC) to exit');
end;


Procedure Save;
var I:integer;
begin
with Savedata do
 begin
Savex:=x;
Savey:=y;
Saveloc:=loc;
SaveTimePlayer:=TimerPlayer;
SaveHp:=hp;
SavePosition:=positionp;
SavePositionShot:=positionShot;
Savepassword:=password;
Savekey:=key;
savedoorsost:=doorsost;
savepasswordI:=passwordI;
for i:=1 to 4 do
begin
Savexs[i]:=xs[i];
Saveys[i]:=ys[i];
end;
end;
end;

procedure Load;
var i:integer;
begin
with Savedata do
 begin
x:=Savex;
y:=Savey;
loc:=Saveloc;
TimerPlayer:=SaveTimePlayer;
Hp:=SaveHp;
Positionp:=SavePosition;
PositionShot:=SavePositionShot;
password:=Savepassword;
key:=savekey;
doorsost:=savedoorsost;
passwordI:=savepasswordI;
for i:=1 to 4 do
begin
xs[i]:=Savexs[i];
ys[i]:=Saveys[i];
end;
end;
end;


procedure TGameForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = $26) and (y>0) and UP
  then
    begin
    y:=y-7;
    Positions_Players_And_Shot(1,1);
    end;
  if (Key = $28) and (y<GameForm.monitor.Height-50) and Down
  then
    begin
    y:=y+7;
    Positions_Players_And_Shot(7,3);
    end;
  if (Key = $27) and (x<GameForm.Monitor.Width-35) and Right
  then
    begin
    x:=x+7;
    Positions_Players_And_Shot(4,2);
    end;
  if (Key = $25) and  (x>0) and LeftP
  then
    begin
    x:=x-7;
    Positions_Players_And_Shot(10,4);
    end;
  if (key=$20) and (control=true) and (hp>0)  then
    begin
    
    shot:=TBitmap.Create;
    shot.LoadFromFile('shot.bmp');
    shot.Transparent:=true;
    shot.TransparentMode:=tmauto;
    xp:=x;
    yp:=y;
    locshot:=loc;
    Control:=false;
    AnimShot:=True;
    SostText:=true;
  
    end;

 if (key=$70) and (loc<>7) and (hp>0) then
 begin
 if fileexists('Saves') then
 Reset(SavePoint)
 else
 Rewrite(SavePoint);
 Save;
 saveflag:=true;
 Loadflag:=false;
 Write(Savepoint,Savedata);
 CloseFile(SavePoint);
 end;

 if (key=$71) and not(victory) and fileexists('Saves.txt')  then
 begin
 if timer1.Enabled=false then
 begin
 timer1.Enabled:=true;
 timer2.Enabled:=true;
 end;
 Reset(SavePoint);
 read(Savepoint,Savedata);
 Load;
 saveflag:=false;
 Loadflag:=true;
 CloseFile(SavePoint);
 end;



  if key=$1B then
 Application.Terminate;
   if (hp>0) and not(victory) then begin
  timer1.Enabled:=true;
  timer2.enabled:=true;
  end;
  end;


procedure TGameForm.FormCreate(Sender: TObject);
begin
  randomize;
  x:=627;
  y:=691;
  hod(1,20);
  AssignFile(SavePoint,'Saves.txt');
  HodPlayer:=false;
  buf:=TBitmap.create;
  buf.Width:=GameForm.Monitor.Width;
  buf.Height:=GameForm.monitor.Height;
  control:=true;
  positionp:=1;
  sost:=1;
  LoadMap;
  GameForm.Cursor:=crNone;
  loc:=1;
  HP:=100;
  TimerPlayer:=0;
  positionShot:=1;
  HodPlayer:=false;
  Victory:=false;
  AnimShot:=False;
  SaveFlag:=false;
  LoadFlag:=false;
  SostText:=false;
  passwordI:=random(10000)+random(10000)+10000;
  key:=false;
  doorsost:=false;
  Application.Icon.Handle:= LoadIcon(hInstance,'SC');
  end;


procedure TGameForm.Timer1Timer(Sender: TObject);

begin

if (xp>GameForm.Monitor.Width) or (xp<0) or (yp>GameForm.Monitor.Height) or (yp<0) or (locshot<>loc) then
  begin

  Control:=true;
  shot.Free;
  shot:=nil;
  sost:=positionShot;
  end;
  if control=false then
  begin
  case sost of
  1:  yp:=yp-90;
  2:  xp:=xp+90;
  3:  yp:=yp+90;
  4:  xp:=xp-90;
  end;
  end;

Right:=true;
LeftP:=True;
UP:=true;
Down:=true;


MapContr(loc,x,y,hp);
MapDraw(loc);

  if timer1.Enabled=false then
  startmessage;


 if (HP<=0) and (AnimShot=false)  then begin
case positionp of
1..3:buf.Canvas.Draw(x,y,pers[13]);
4..6:buf.Canvas.Draw(x,y,pers[14]);
7..9:buf.Canvas.Draw(x,y,pers[15]);
10..12:buf.Canvas.Draw(x,y,pers[16]);
 end;

GameOverInterface;
timer1.Enabled:=false;
timer2.enabled:=false;
end;




if (HP>=1) and (AnimShot=false) then
case positionp of
  1: animhod;
  4: animhod;
  7: animhod;
  10:animhod;
end;


  MapDrawObject(loc);
  ShotStart(x,y,loc,hp,passwordI);
  buf.Canvas.Draw(xp,yp,shot);
  BossFight(loc,xp,yp,x,y,hp);


if  AnimShot=true then
case positionp of
  1: buf.Canvas.Draw(x,y,pers[17]);
  4: buf.Canvas.Draw(x,y,pers[18]);
  7: buf.Canvas.Draw(x,y,pers[19]);
  10:buf.Canvas.Draw(x,y,pers[20]);
end;


if (SostText) and (loc=5) and (x>=160) and (x<=230) and (y>=320) and (y<=410)   then
begin
if password<>inttostr(passwordI)
then
begin
timer1.enabled:=false;
If not InputQuery('', 'Please Enter The Password', password) then
else
If password=inttostr(passwordI) then
else
hp:=hp-hp;
timer1.enabled:=true;
end
else
begin
Buf.canvas.Brush.Color:=clMoneyGreen;
Buf.canvas.pen.Style:=psClear;
Buf.canvas.RoundRect(500,200,800,600,10,10);
Buf.canvas.font.color:=clMaroon;
Buf.canvas.font.Size:=17;
Buf.Canvas.font.Name:='Euphemia';
Buf.Canvas.Brush.Style:=bsclear;
buf.Canvas.TextOut(600,210,'MAP');
buf.Canvas.TextOut(610,230,'5 UP');
buf.Canvas.TextOut(610,260,'3 LEFT');
buf.Canvas.TextOut(610,290,'2 UP');
buf.Canvas.TextOut(610,320,'5 RIGHT');
buf.Canvas.TextOut(610,350,'2 DOWN');
buf.Canvas.TextOut(630,380,'Key');
end;
end;
if password<>inttostr(passwordI) then
sosttext:=false;


if victory then
begin
VictoryInterface;
timer1.Enabled:=false;
timer2.Enabled:=false;
end;

HodPlayer:=false;
AnimShot:=False;
InterfaceDraw;
GameForm.Canvas.Draw(0,0, buf);

end;


procedure TGameForm.Timer2Timer(Sender: TObject);
begin
inc(TimerPlayer);
if saveflag then
inc(save_load_time);
if loadflag then
inc(save_load_time);
if (save_load_time)>1 then
begin
saveflag:=false;
loadflag:=false;
save_load_time:=0;
end;
end;


end.



