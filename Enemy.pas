unit Enemy;

interface
uses Windows,SysUtils,Graphics,Classes;
var shot:Tbitmap;
Control,Victory:boolean;
sost,positionShot,hpBoss:integer;
xs,ys:array[1..4] of integer;
procedure ShotStart(var xplayer,yplayer,location,life,pass:integer);
procedure BossFight(var location,xshot,yshot,xplayer,yplayer,lifebar:integer);
implementation
uses MapLevel;
var
DragonShots:array [1..4] of Tbitmap;
skull:array[0..3] of Tbitmap;
bossshot:Tbitmap;
freeSpeedEnemyShots,freeBossLocation:boolean;
xe,ye,xBossShot,yBossShot,sostBoss:integer;
sostbossshot,AimPlayer,AimPlayer1:boolean;

procedure loadshots;
var i:integer;
begin
  For i:=1 to 4 do
  begin
  DragonShots[i]:=TBitmap.Create;
  DragonShots[i].LoadFromFile('Maps\Location4\EnemyShot\EnemyShots.bmp');
  DragonShots[i].Transparent:=true;
  DragonShots[i].TransparentMode:=tmauto;
  xs[1]:=288; ys[1]:=621;
  xs[2]:=435; ys[2]:=75;
  xs[3]:=963; ys[3]:=642;
  xs[4]:=1260; ys[4]:=637;
  freeSpeedEnemyShots:=false;
  AimPlayer:=true;
  AimPlayer1:=true;
  end;
end;

procedure ShotStart(var xplayer,yplayer,location,life,pass:integer);
var i:integer;
begin
If location=4 then
begin
if freeSpeedEnemyShots=true then
loadshots;

buf.canvas.draw(xs[1],ys[1],DragonShots[1]);
buf.canvas.draw(xs[2],ys[2],DragonShots[2]);
buf.canvas.draw(xs[3],ys[3],DragonShots[3]);
buf.canvas.draw(xs[4],ys[4],DragonShots[4]);
if (xplayer>=xs[1]-20) and (xplayer<=xs[1]+48) and (yplayer>=ys[1]) and (yplayer<=ys[1]+63) and (AimPlayer) then
begin
life:=life-20;
AimPlayer:=false;
end;
if (xplayer>=xs[2]-20) and (xplayer<=xs[2]+48) and (yplayer>=ys[2]-20) and (yplayer<=ys[2]+63) and (AimPlayer) then
begin
life:=life-20;
AimPlayer:=false
end;
if (xplayer>=xs[3]-20) and (xplayer<=xs[3]+45) and (yplayer>=ys[3]) and (yplayer<=ys[3]+63) and (AimPlayer) then
begin
life:=life-20;
AimPlayer:=false;
end;
if (xplayer>=xs[4]-50) and (xplayer<=xs[4]+50) and (yplayer>=ys[4]-30) and (yplayer<=ys[4]+63) and (AimPlayer1) then
begin
life:=life-20;
AimPlayer1:=false;
end;

If freeSpeedEnemyShots=false then
begin
ys[1]:=ys[1]-40;
ys[2]:=ys[2]+40;
ys[3]:=ys[3]-30;
xs[4]:=xs[4]-30;

end;

if (xplayer>=1281) and (xplayer<=1330) and (yplayer>=334) and (yplayer<=390) then
begin
Buf.canvas.Brush.Color:=clMoneyGreen;
Buf.canvas.pen.Style:=psClear;
Buf.canvas.RoundRect(500,200,800,600,10,10);
Buf.canvas.font.color:=clMaroon;
Buf.canvas.font.Size:=17;
Buf.Canvas.font.Name:='Euphemia';
Buf.Canvas.Brush.Style:=bsclear;
buf.Canvas.TextOut(600,200,'Password');
buf.Canvas.TextOut(610,340,inttostr(pass));
end;

if (xs[4]<0) and (ys[2]>680) and (ys[1]<0) and (ys[3]<0) and (ys[1]<0)  then
begin
freeSpeedEnemyShots:=true;
For i:=1 to 4 do
  begin
  DragonShots[i].Free;
  DragonShots[i]:=nil;
  end;
end;
end

else freeSpeedEnemyShots:=true;
if location<>4 then
For i:=1 to 4 do
  begin
  DragonShots[i].Free;
  DragonShots[i]:=nil;
  end;

  end;
procedure loadboss;
var i:integer;
begin
For i:=0 to 3 do
  begin
  skull[i]:=TBitmap.Create;
  skull[i].LoadFromFile('Characters\Enemy\Death'+inttostr(i)+'.bmp');
  skull[i].Transparent:=true;
  skull[i].TransparentMode:=tmauto;
  end;
  hpboss:=300;
  xe:=587;
  ye:=9;
  freeBossLocation:=false;
  sostbossshot:=true;
  AimPlayer:=true;
  end;
procedure BossFight(var location,xshot,yshot,xplayer,yplayer,lifebar:integer);
var i:integer;
begin

if location=7 then
begin
if freeBossLocation=true then
loadboss;

Buf.canvas.font.color:=clBlue;
Buf.canvas.font.Size:=17;
Buf.Canvas.font.Name:='Arial';
buf.Canvas.TextOut(1160,720,'HP Boss ');
Buf.canvas.Brush.Color:=clFuchsia;
Buf.canvas.pen.Style:=psClear;
Buf.canvas.RoundRect(1050,750,hpboss+1050,760,2,2);
Buf.Canvas.Brush.Style:=bsclear;
Buf.canvas.pen.color:=clWhite;
Buf.canvas.pen.Style:=psSolid;
Buf.canvas.RoundRect(1350,750,1050,760,2,2);

if xe+50>=xplayer then
xe:=xe-5;
if xe+50<xplayer then
xe:=xe+5;

if (xshot>=xe) and (xshot<=xe+140) and (yshot>=ye) and (yshot<=ye+166) and (hpboss<>0) and (shot<>nil) then
begin
   Control:=true;
  shot.Free;
  shot:=nil;
  sost:=positionShot;

  hpboss:=hpboss-10;
  xshot:=xplayer;
  yshot:=yplayer;
  sostboss:=1;

  end;


if sostboss=0 then
begin
case hpboss of
250..300:buf.Canvas.Draw(xe,ye,skull[2]);
150..240:buf.Canvas.Draw(xe,ye,skull[3]);
10..140:buf.Canvas.Draw(xe,ye,skull[0]);
0: begin
buf.Canvas.Draw(xe,ye,skull[1]);
Victory:=true;
end;

end;
end;
 if sostboss=1 then
  begin
  buf.Canvas.Draw(xe,ye,skull[1]);
  sostboss:=0
  end;


if (sostBossShot) and (hpboss>0) and (xplayer>=xe-100) and (xplayer<=xe+140) then
begin
bossshot:=TBitmap.Create;
bossshot.LoadFromFile('bossshot.bmp');
bossshot.Transparent:=true;
bossshot.TransparentMode:=tmauto;
xBossShot:=xe-100;
yBossShot:=ye+100;
sostBossShot:=false;
AimPlayer:=true;
end;

buf.Canvas.Draw(xBossShot,yBossShot,bossshot);

if (xplayer>=xBossShot) and (xplayer<=xBossShot+300) and (yplayer>=yBossShot) and (yplayer<=yBossShot+100) and (AimPlayer) then
begin
lifebar:=lifebar-20;
AimPlayer:=false;
end;
if sostBossShot=false then
begin
yBossShot:=yBossShot+30;
if yBossShot>=750 then
begin
 bossshot.free;
 bossshot:=nil;
 sostBossShot:=true;
 end;

end;
end;





if location<>7 then
begin
freebosslocation:=true;
For i:=0 to 3 do
  begin
  Skull[i].Free;
  Skull[i]:=nil;
  end;
 bossshot.free;
 bossshot:=nil;

  end;

end;


  end.
