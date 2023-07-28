%sample code  the new proposed MSFCM
%  load satimage;%%obtain "data" as training dataset, "label" as its target.

dataset_str={'wine'};
load(dataset_str{1});
cluster_n =3; m=2;
max_it  = 5000;        % Max. iteration
min_impro = 10^-6;  % Min. improvement
[data_n,data_s] = size(data);
U0 = rand(cluster_n, data_n);U0 = U0./sum(U0);
[U, V, it, time]=MSFCM_it(data, U0, cluster_n, m,max_it,min_impro);
[~,label1]=max(U);

[FM, ARI, NMI] = evaluate(label, label1');
       
%%%%%%%%%% Ö¸±ê %%%%%%%%%%%%%%%%%%%
   N=5; %disp number.
  disp(['MSFCM obtained F*=' num2str(FM,N) ', ARI=' num2str(ARI,N) ', MNI=' num2str(NMI,N)...
      'within ' num2str(it,N) ' iterations ' ', time=' num2str(time,N) ] )
  