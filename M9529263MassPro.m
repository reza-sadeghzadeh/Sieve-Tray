clc
clear
format short




v=1;
clc

Mcs2 =76.139;
pair = 1.225;
pcs2 = 1260;
Mair = 0.79*28 + 0.21*32;
Mgas = 0.0789*Mcs2 * (1 -0.0789)*Mair;
Msolv = 180;
psolv = 810;
Q = 0.4;
clc
x=6;
while(x>3 || x<1)
    
notification = sprintf("__This programme works only for SI system units  \n\n   There are two model of solving:\n   CODE_1- By entering the x (from Mass Transfer Operation project_Dr.Nasrin Etesami):\n   CODE_2- By entering the Student ID:\n   CODE_3- Exit\n")
x =input("Enter the code number:");
clc
end

if(x==1)%solving with first method
    disp("Enter the x: ")
    x =input("EXIT_3 and Std.ID_2  >>>");
    x7=x;
    L = Q/(5.5*x);
    q =L;
end
if(x==2)%solving with second method
    id = input("Enter the Std. ID: ")
    while (fix(id/1000000) ==0 || fix(id/1000000)>10)
    
        error_1 = sprintf("\n the Std. ID must be 7 digits\n ")
        id = input("Enter the Std. ID\n(for exit enter 0 ): ")
        if(id==0)
            break;
        end
    
    end

    if(id~=0)
    id1 =  id;
    x1 = 3*(id1 - fix((id1/10))*10);
    x2 = fix((id1 -(fix((id1/100))*100))/10);
    x3 =2*( fix((id1 -(fix((id1/1000))*1000))/100));
    x=x1 + x2 + x3;
    x7=x;
    L = Q/(5.5*x);
    q =L;
    id1=0;
    end
end
clc
clear  x1 x2




while(x>3 || x<1)
ettention = sprintf("is your liquid a foaming one or not:\n  CODE_1 : For foaming liq.\n  CODE_2 : For nonfoaming liq\n  CODE_3 : For EXIT")
x =input("inter the code number:");
if(x==1)
    v = 0.75;
end

if(x==2)  
    clc
notification = sprintf("__enter your codfficient for actual design for gas velocity:\n (it's almost between 0.8 and 0.85 and we recomend to enter the co. in this range))\n(It will be use in multiplyinh the flooding velocity)")
v=input(">>>"); 
end
clc
end%asking the foaming mode
clc
if(x~=3)
x1=6;
while(x1>4 || x1<1)
ettention = sprintf("what kind of flow you need?:\n  CODE_1 : Straight trays\n  CODE_2 : rectangular trays\n  CODE_3 : cross-flow trays\n  CODE_4 : Other\n  CODE_5 : Exit")
x1 =input("Enter the code number:");
if(x1 == 1)%straight
    dw = 5.257;
end
if(x1==2)%triangular
    dw = 14.145;
end
    if(x1==3)%cross-flow
        dw=8.808;
    end
if(x1==5)
    x=3;
    break;
end
clc
end%asking the flow type
end


if(x~=3 && x1==4)
    dw = input("Enter your downspout in percent% :\n(It does as a percent of At for Ad)");

    if(dw<=0 || dw>=100)
    error("___the downspout can't be this (it has a value between 0-99 %)")
end
end
clc
if(x~=3)
notice = sprintf(" Enter the friction factor (f) in this conditions:")
f1 = input(">>>");
end
clc
if(x~=3 && x1~=5)


    clc
ettention = sprintf("what is the area taken by the tray support and disengaging and distributing zones?:\n(If you want to add a percent of At for this area, Inter 0)")
a =input("  Enter the area in square meter:");
if(a==0)
    ab =input(" Enter the percent% value:")
    
end
clc
end%asking the flow type
if(x~=3)
pgas = input("Enter the gas density:(for dilute conditions enter 0):\n>>>" );
if(pgas == 0)
    pgas=(29/22.41)*(273/(273+24));
end
end

u=1;




for j =1

    if(x==3 || x1==5)
    clear all
    clc
    break;
    end
  o=60/760;
mg =0.363*o +(1-o)*1.48 * 10^-5;
mg = mg/1000;
s = 0.03;

Mcs2 =76.139;
pair = 1.225;
pcs2 = 1260;
Mair = 0.79*28 + 0.21*32;

%Mgas = 0.0789*Mcs2 * (1 -0.0789)*Mair;
%pgas = 0.0789 * pcs2 + (1 - 0.0789) * pair;
%pgas = pgas*(273/(273+24));
Msolv = 180;
psolv = 810;
%psolv = 810;
%Q = 0.4;

%q = 0.0038;
    %end of the L determination and it's determined
    %hole diamiter
    i=1;
    clc
    x5=4;
    while(x5~=0 )
        i=i+1;
        d0(i) = input("Enter the tray hole diameter(s):(At end, enter 0)\n");
        if(d0(i)==0)
            d0(i)=[];
            break;
            
        end
    end
    clc
    d0(1)=[];
    clc
    i=1;
    clc
    x5=4;
    while(x5~=0 )
        i=i+1;
        t(i) = input("Enter your tray(s) spacing :(At end enter 0)\n");
        if(t(i)==0)
            t(i)=[];
            break;
            end
    end
    clc
    t(1)=[];
    clc
    p=input("Enter a value for pitch >>>");
    %pitch
    th = [0.001 0.0015 0.002 0.0025 0.003 0.0035 0.004];
    
    
    
    
    
    
    clc
    i=1;
   u=1;
   while (u <= length(t))

     for y=1:length(d0)   
    J(u,y)=(q/Q)*(psolv/pgas)^0.5;
    J1(u,y)=(q/Q)*(psolv/pgas)^0.5;
    %(L'/G')*(pG/pL)^0.5 = J;
     end
    for i=1:length(d0)
        
    A0Aa(u,i) = 0.907*(d0(i)/p(j))^2;
    a0aa=A0Aa(u,i);
    
    
    
    al(u,i)= 0.0744*t(u) + 0.01173;
    be(u,i) = 0.0304*t(u) + 0.015;
    if(a0aa>=0.1)
     if (J(u,i)>=0.01 && J(u,i)<=0.1)
       J(u,i)=0.1;
     end
    end
     if(a0aa<0.1)
        
        al(u,i) = al(u,i)*((5*a0aa)+0.5);
        be(u,i)= be(u,i)*((5*a0aa)+0.5);
     end

    Cf(u,i) = (al(u,i)*log10(1/J(u,i)) + be(u,i))*(s/0.02)^0.2;
   
    
    
    Vf(u,i) = Cf(u,i)*(((psolv - pgas)/(pgas))^0.5);
    Vf1(u,i) = Vf(u,i)*v;
    
            
    An(u,i) = Q./Vf1(u,i);
    
    At(u,i) = An(u,i)./(1-dw/100) ;
    
    T(u,i) = (4*(At(u,i)/pi))^0.5;
    f=T(u,i)- fix(T(u,i));
    if (f>=0.5 && f<0.75 )
    T1(u,i) = fix(T(u,i))+0.75;
    elseif(f >=0.75)
    T1(u,i) = fix(T(u,i))+1;
    elseif (f<0.25 )
     T1(u,i) = fix(T(u,i))+0.25;
    elseif(f>=0.25 && f<0.5)
         T1(u,i) = fix(T(u,i))+0.5;
    end
    
    At1(u,i) = pi*(T1(u,i))^2/4;
    
    
if x1 == 1
  w(u,i)=0.6*T1(u,i);
    
  end
if x1 == 2
    w(u,i)=0.6*T1(u,i);
end
if x1 == 3
    w(u,i)=0.7*T1(u,i);
end

       switch dw
           case  3.877
               w(u,i) = 0.55*T1(u,i);
               wc(u,i) = 0.4181*T1(u,i);%weir distance from center
               
           case 6.899
               w(u,i)=0.65*T1(u,i);
               wc(u,i) = 0.2516*T(u,i);
               
           case 11.255
               w(u,i) = 0.75*T1(u,i);
               wc(u,i) = 0.3296*T1(u,i);
               
           case 14.145
               w(u,i) = 0.8*T1(u,i);
               wc(u,i) = 0.1991*T1(u,i);
               
           case 8.8 
               w(u,i) = 0.7*T1(u,i);
               wc(u,i) = 0.3562*T1(u,i);
              
           case 8.808
               w(u,i) = 0.7*T1(u,i);
               wc(u,i) = 0.3562*T1(u,i);
              
           case 5.257
               w(u,i) = 0.6*T1(u,i);
               wc(u,i) = 0.3993*T1(u,i);
              
       end
               
           
   
Ad(u,i) = (dw/100)*At1(u,i);
    if(a==0)
Aa(u,i)=At1(u,i) -2*Ad(u,i)-(ab/100)*(At1(u,i));
    else
    Aa(u,i)=At1(u,i) -2*Ad(u,i)-a;
    end
A0(u,i) = A0Aa(u,i)*Aa(u,i);
    
check_tab_err(u,i) = 1;
%checking q/w;


end
    
    
    
    
    
    

   
    u = u+1;
end%for t at first




        
for u=1:length(t)
    for i=1:length(d0)
hh=0.001;
hhh=0;
while hh~=hhh

        tw(u,i)=T1(u,i)/w(u,i);
        
        W(u,i) = (w(u,i)*(tw(u,i)^2 - ( ((tw(u,i)^2)-1)^0.5 + 2*hh/w(u,i))));
        hhh=(w(u,i)/W(u,i))^0.666*(q./w(u,i))^0.666*0.6666;
       
        if hhh==hh 
           
                h1(u,i)=hhh;
                break;
        end
        if hhh~=hh
            hh=hhh;
            hhh=0;
        end
    end
    end
end

  hw = input("enter your cpecial 'hr' (weir height)>>>");
clc

l= input("enter your your desired thickness for tray>>>");
pre_dro_err(u,i) = zeros(1,1);
gas_vel_err(u,i) = zeros(1,1);
clc
for u=1:length(t) %tray
    for i=1:length(d0) %d0
        
     C0(i) = 1.09*(d0(i)/l)^0.25;%row for d0 and colomn for thickness and dosen't depend on tray scape
    
     V0(u,i) = Q./A0(u,i);
     Re(u , i) = (d0(i)*V0(u , i)*pgas)/(mg);
     hd(u,i) = C0(i)*V0(u,i)^2.*pgas*( 0.4*(1.25 - A0(u,i)/An(u,i)) + (4*f1*l)/d0(i)+(1- A0(u,i)/An(u,i))^2);
     hd(u,i) = hd(u,i)/(2*9.807*psolv); 
     Va(u,i) = Q./Aa(u,i);
     z(u,i) = (T1(u,i) + w(u,i))/2;
     hl(u,i) = 6.1*10^-3 + 0.725*hw - 0.238*hw*Va(u,i)*pgas^0.5 + 1.225*q/z(u,i);
     hr(u,i) = 6*s*1/(psolv * d0(i)*9.807);
     hg = hd + hr + hl;
     ap(u,i) = (hw-0.025)*w(u,i);
     
     if(ap(u,i)<Ad(u,i))
         Ada(u,i) = ap(u,i);
     else
         Ada(u,i) = Ad(u,i);
     end     
     h2(u,i) = 3/(2*9.807)*(q./Ada(u,i))^2;    
     h3(u,i) = hg(u,i) + h2(u,i);    
     
     if(hw + h1(u,i) + h3(u,i) > t(u)/2)
         sprintf("in tray %0.3f meter and d0 of %0.3f meter we've got some problem because of checking the pressure drop condition\nso that it is not OK\nYou can change some values to gain the OK solution",t(u),d0(i) )
          pre_dro_err(u,i) = -1;
     end
     
     z2 = 2*wc(u,i);
     Vow(u,i) = (0.0229*s*32.2)/(mg) * ((mg^2*psolv)/(s*32.2*pgas*d0(i)*pgas))^0.379*(1/d0(i))^0.293*((2*Aa(u,i)*d0(i))/(((sqrt(3)*p^3))^(2.8/(z2/d0(i))^0.724)));
     if(V0(u,i) <= Vow(u,i))
     gas_vel_err(u,i) = -1;
         sprintf("in tray %0.3f meter and d0 of %0.3f meter we've got some problem because of checking the gas velovity limit condition(weeping)\nso that it is not OK\nYou can change some values to gain the OK solution",t(u),d0(i))
     end
     if(q./w(u,i)> 0.032)
       sprintf("in tray %0.3f meter and d0 %0.3f meter, we've got some problem because of checking the TABLE_6-1 condition\nso that it is not OK\nYou can change some values to gain the OK solution",t(u),d0(i)) 
       check_tab_err(u,i) = -1;
     end 
    if (hg(u,i)*9.8*psolv) > 800 && (hg(u,i)*9.8*psolv) <500
        sprintf("in tray %0.3f meter and d0 %0.3f meter, we've got some problem because of checking the TABLE_6-1 last row (total pressure deop)\nso that it is not OK\nYou can change some values to gain the OK solution",t(u),d0(i))
    end
    end
end
    





for u = 1:length(t)
    for i = 1:length(d0)
        dp = hg(u,i)*9.8*psolv;
        if (gas_vel_err(u,i)~=-1 && pre_dro_err(u,i)~=-1 && check_tab_err(u,i)~=-1 && (hg(u,i)*9.8*psolv) <800 && (hg(u,i)*9.8*psolv) >500)
            sprintf("in this conditions acted, the tray %0.3f meter with d0 of %0.3f meter is OK\ndo the last work which I can not do, the cheking of ENTRAINMENT by FIG_6.17\nIt is available inte file which is given as project Delivered ;)",t(u),d0(i))
           
        end
       
    end
end

end

