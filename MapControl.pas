unit MapControl;

interface
uses Windows,SysUtils,Graphics,Classes;
var
loc,x,y:integer;
Right,UP,LeftP,Down,key,DoorSost:boolean;
procedure MapContr(var loc,x,y,life:integer);

implementation
uses MapLevel;
procedure MapContr(var loc,x,y,life:integer);
begin
case loc of
1:begin

if ((x<=207) and (x>=193) and (y>=-5) and (y<=54)) or ((x<=928) and (x>=914) and (y>=-5) and (y<=54))  then
Right:=false;
if ((x>=333) and (x<=347) and (y>=-5) and (y<=54)) or ((x>=1057) and (x<=1071) and (y>=-5) and (y<=54))   then
LeftP:=false;
if ((x<=347) and (x>=193)   and (y>=29) and (y<=75)) or ((x<=1069) and (x>=918)   and (y>=29) and (y<=75)) then
UP:=false;

If (y<0) and (x>500) and (x<750) then
begin
loc:=2;
y:=abs(y-680);
end;
end;

2:begin

if ((x>=746) and (y>=19) and (y<=264)) or ((x>=728) and (y>=269) and (y<=374)) or ((x>=527) and (x<=545) and (y>=-5) and (y<=40)) or ((x>=780) and (y>=-5) and (y<=19)) then
Right:=false;
if ((x>=524) and (x<=550) and (y>=271) and (y<=374)) or ((x>=490) and (x<=536) and (y>=19) and (y<=271)) or ((x>=460) and (x<=480) and (y>=-5) and (y<=40)) or ((x>=716) and (x<=732) and (y>=-5) and (y<=47))  then
LeftP:=false;
if ((x<=536)  and (y>=340) and (y<=391)) or ((x>=736)   and (y>=340) and (y<=391)) then
UP:=false;
if ((x<=510) and (x>=460)   and (y>=10) and (y<=26)) or ((x<=800) and (x>=750)   and (y>=10) and (y<=26)) then
Down:=false;

If (y>700) and (x>500) and (x<800) then
begin
loc:=1;
y:=abs(y-680);
end;

If (y<0) and (x>570) and (x<700) then
begin
loc:=3;
y:=abs(y-680);
end;
end;

3:begin
if doorsost=false then
If (Key) and (x>=550) and (x<=650) and (y<=93) then
DoorSost:=true;
if doorsost then
begin
if ((x>=535) and (x<=557) and (y<=81)) or ((x>=711) and (x<=732) and (y<=81)) or ((x>=844) and (x<=1313) and (y<=201)) or ((x>=458) and (x<=529) and (y<=124)) or ((x>=738) and (x<=816) and (y<=138)) or ((x>=814) and (x<=830) and (y<=68)) or ((x>=423) and (x<=452) and (y<=68)) then
UP:=false;
MaplevelObject3[1,13]:=9;
MaplevelObject3[1,14]:=10;
MaplevelObject3[1,15]:=11;
end
else
begin
if ((x>=528) and (x<=739) and (y<=75)) or ((x>=81) and (x<=417) and (y<=201)) or ((x>=844) and (x<=1313) and (y<=201)) or ((x>=458) and (x<=529) and (y<=124)) or ((x>=738) and (x<=816) and (y<=138)) or ((x>=814) and (x<=830) and (y<=68)) or ((x>=423) and (x<=452) and (y<=68)) then
UP:=false;
MaplevelObject3[1,13]:=6;
MaplevelObject3[1,14]:=7;
MaplevelObject3[1,15]:=8;
end;

if ((x>=444) and (x<=466) and (y<=89) and (y>=61)) or ((x>=738) and (x<=753) and (y<=124) and (y>=61)) or ((x>=822) and (x<=837) and (y>=50) and (y<=201)) or ((x>=52) and (x<=66) and (y<=201) and (y>=0)) or ((x>=1298)  and (y<=375) and (y>=188)) or ((x>=1298)  and (y<=711) and (y>=438))    then
Right:=false;
if ((x>=423) and (x<=438) and (y<=187)) or ((x>=808) and (x<=818) and (y<=124)) or ((x>=521) and (x<=536) and (y<=124) and (y>=60) ) or ((x<=30)  and (y<=697) and (y>=398)) or ((y<=343)  and (x<=30))     then
LeftP:=false;
if  ((y>=697)  and (x<=1313) and (x>=724)) or ((y>=697)  and (x<=536) and (x>=25))     then
Down:=false;





If (y>700) and (x>570) and (x<700) then
begin
loc:=2;
y:=abs(y-680);
end;
If (y>=362) and (x>=1325) and (y<=390) then
begin
loc:=4;
x:=abs(x-1320);
end;
If (y>=362) and (x<=0) and (y<=390) then
begin
loc:=5;
x:=abs(x-1320);
end;

If (y<=0) and (x>=30) and (x<=60) then
begin
loc:=6;
y:=682;
x:=53;
end;

If (y<=20) and (x>=578) and (x<=683) and doorsost then
begin
loc:=7;
y:=abs(y-680);

end;


end;


4:begin
if ((x>168) and (x<280)) and ((y>-7) and (y<530)) then
life:=life-10;
if ((x>168) and (x<280)) and ((y>600) and (y<730)) then
life:=life-10;
if ((x>315) and (x<420)) and ((y>222) and (y<730)) then
life:=life-10;
if ((x>315) and (x<420)) and ((y>-7) and (y<152)) then
life:=life-10;
if ((x>462) and (x<567)) and ((y>-7) and (y<23)) then
life:=life-10;
if ((x>462) and (x<567)) and ((y>100) and (y<605)) then
life:=life-10;
if ((x>462) and (x<567)) and ((y>667) and (y<730)) then
life:=life-10;
if ((x>665) and (x<945)) and ((y>667) and (y<730)) then
life:=life-10;
if ((x>665) and (x<945)) and ((y>-7) and (y<613)) then
life:=life-10;
if ((x>574) and (x<665)) and ((y>285) and (y<404)) then
life:=life-10;
if ((x>994) and (x<1239)) and ((y>-7) and (y<89)) then
life:=life-10;
if ((x>994) and (x<1239)) and ((y>159) and (y<730)) then
life:=life-10;



if ((x<=30)  and (y<=697) and (y>=398)) or ((y<=343)  and (x<=30))      then
LeftP:=false;
if  ((y>=595)  and (x<=1330) and (x>=1238)) or ((y>=651)  and (x<=994) and (x>=952)) or ((y>=651)  and (x<=320) and (x>=279))      then
Down:=false;







If (y>=362) and (x<=0) and (y<=390) then
begin
loc:=3;
x:=abs(x-1320);
end;
end;

5:begin
If ((y<=199)  and (x<=721) and (x>=601)) then
life:=100;

if ((x<=721)  and (x>=706) and (y<=187) and (y>=124))     then
LeftP:=false;
if  ((y>=75)  and (y<=103) and (x>=601) and (x<=721))     then
Down:=false;
if  ((y<=200)  and (x<=721) and (x>=601))     then
UP:=false;
if  ((y<=152)  and (y>=103) and (x<=669) and (x>=594)) or ((x>=1298)  and (y<=375) and (y>=188)) or ((x>=1298)  and (y<=711) and (y>=438))      then
Right:=false;

If (y>=362) and (x>=1326) and (y<=390) then
begin
loc:=3;
x:=abs(x-1320);
end;
end;

6:begin
If ((y<=710) and (y>=647) and (x=53)) or ((x<=46) and (y=647) and (x>=32)) or ((x=32) and (y>=633) and (y<=647)) or ((x>=32) and (y=633) and (x<=67)) or ((x=67) and (y>=633) and (y<=647))  then
else
life:=life-life;
if (y=647) and (x=67) then
begin
key:=true;
end;
if key then
MaplevelObject6[12,3]:=0
else
MaplevelObject6[12,3]:=3;

If (y>=685) and (x>=20) and (x<=60) then
begin
loc:=3;
y:=abs(y-680);
end;
end;

7:begin
if ((x<=30)  and (y<=697) and (y>=398)) or ((y<=343)  and (x<=30))     then
LeftP:=false;
if  ((y>=697)  and (x<=1313) and (x>=724)) or ((y>=697)  and (x<=536) and (x>=25))     then
Down:=false;
if  ((y<=454)  and (x<=1313) and (x>=17))     then
UP:=false;
if   ((x>=1298)  and (y<=375) and (y>=188)) or ((x>=1298)  and (y<=711) and (y>=438))      then
Right:=false;

If (y>=711) and (x>=599) and (x<=669)  then
begin
loc:=3;
y:=abs(y-643);
end;
end;


end;
end;


end.
