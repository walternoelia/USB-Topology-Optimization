%% DICOM
A_G_F_wieding
if MALLADO==0 || MALLADO==3
    %% bone
    Directory='connor\';
    %%%%%%%%%%%%%%%%%%%%%%
    CASO='connor';
    %%%%%%%%%%%%%%%%%%%%%%%
   %%% Lectura de Imagen
    sizeImg=strcat(num2str(nelx/Scale),'x',num2str(nely/Scale));
    %%%%%%%%%
    img10=imread(strcat(Directory,CASO,'_',sizeImg,'_activo.png'));
    [img10] = img_resize(img10,Scale);  %% RESIZE
    %% binary conversion
    
    %% IMPLANTE BW
      img1=imread(strcat(Directory,CASO,'_',sizeImg,'_Titanio.png'));
    [img1] = img_resize(img1,Scale);  %% RESIZE
    binary_imp=convert2gray(img1);
    binary_imp=(1-binary_imp)>0;
    %% HUESO
     img2=imread(strcat(Directory,CASO,'_',sizeImg,'_bone2.png'));
    [img2] = img_resize(img2,Scale);  %% RESIZE
    binary_b=convert2gray(img2)>0;
    
    binary_b=(binary_imp)+(binary_b);
    binary_b=binary_b>0;
    %% CORTICAL
     img6=imread(strcat(Directory,CASO,'_',sizeImg,'_cortical2.png'));
    [img6] = img_resize(img6,Scale);  %% RESIZE
    binary_C=convert2gray(img6)>0;
    binary_C=(binary_imp)+(binary_C);
    binary_C=binary_C>0;
    %% CROMO
    img9=imread(strcat(Directory,CASO,'_',sizeImg,'_cromo.png'));
    [img9] = img_resize(img9,Scale);  %% RESIZE
    binary_Cr=convert2gray(img9)>0;
    binary_Cr=(binary_imp)+(binary_Cr);
    binary_Cr=binary_Cr>0;
    %% ESPONJOSO

    %% DEFINICION DE MATERIALES
      design=(binary_imp)>0;   
    mB=1-binary_b>0;  % Material Oseo
    mBc=(1-binary_C); % Material Oseo Cortical
    mBc=mBc>0;
    mCr=(1-binary_Cr)>0;
    mBe=(mB-mBc-design); % Material Oseo esponjoso
    mBe=mBe>0;
    mB=mBc+mBe;
   
    passive=design.*(convert2gray(img10)>0)*2;% 2 activo 1 pasivo
   
    mV=(1-mB-mCr).*(1-design);
    
end

B_F_Connor
A_Mat_F2_Connor