
%% Resultados ESF-DEF
for j= 1:size(F,2)
    Ui=U(:,j);
    for i=1:ne
        u(1:2,i)=Nc(eta,zeda)*Ui(edofMat(i,:));
        def(1:3,i)=B*Ui(edofMat(i,:))/2;
        esf(1:3,i)=Etot_e(i)*lDi(nuMat(Material(i)))*def(1:3,i);
    end
    esfv=(esf(1,:)'.^2-esf(2,:)'.*esf(1,:)'+esf(2,:)'.^2+3.*esf(3,:)'.^2).^0.5;
    defv=(def(1,:)'.^2-def(2,:)'.*def(1,:)'+def(2,:)'.^2+3.*def(3,:)'.^2).^0.5;
    
    %% deformaciones 
    defx=reshape(def(1,:),nely,nelx);
    defy=reshape(def(2,:),nely,nelx);
    defxy=reshape(def(3,:),nely,nelx);
    %% esfuerzos
    esfx=reshape(esf(1,:),nely,nelx);
    esfy=reshape(esf(2,:),nely,nelx);
    txy=reshape(esf(3,:),nely,nelx);
    %% desplazamientos
    ux=reshape(u(1,:),nely,nelx);
    uy=reshape(u(2,:),nely,nelx);
    %% reshape
    defv=reshape(defv,nely,nelx);
    esfv=reshape(esfv,nely,nelx);
end
for j= 1:size(F,2)
    Ui=U(:,j);
    AMPLIF=paso/max(abs(Ui(:)));
    for i=1:nodos
        XF(i,1)=XI(i,1)+AMPLIF*-Ui(2*i-1);
        YF(i,1)=YI(i,1)+AMPLIF*-Ui(2*i);
    end
    
    xf=XF(node);
    yf=YF(node);
    
end
desT=(ux.^2+uy.^2).^.5;