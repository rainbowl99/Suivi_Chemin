%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Controlleur
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [output]=control(inp)

% Variables
  vf= inp(1); % vitesse du véhicule leader 
  df= inp(2); % distance signée du vehicule leader au chemin
  db= inp(3); % distance signée du vehicule suiveur au chemin
  dfb= inp(4); % distance entre le vehicule leader et le vehicule suiveur
  thetahatf= inp(5);
  thetahatb= inp(6)
  Id= inp(7);
% calcul de la commande
  
  dfstar= 1;
  dbstar= -1;
  dfbstar= 4;
  ef= df - dfstar;
  eb= db - dbstar;
  efb= dfb - dfbstar;
  k1 = 1;
  k2 = 1;
  k3 = 0.21;
  k4 = 1;
  k5 = 1e-3;
  kfb= 4;

  wf= -k1*vf*ef - k2 * abs(vf) * thetahatf; % vitesse angulaire du veicule leader (commande) 
  vb=  vf + kfb*efb;  % vitesse lineaire du veicule suiveur
  wb= -k3*vb*eb - k4 * abs(vb) * thetahatb -k5*abs(vb)*Id;   % vitesse angulaire du veicule suiveur
  u= [wf;vb;wb];
  
output= u;

  