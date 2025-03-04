# **Installations**

## **Conda**

!!! warning
    **Dépendance requise**

GeVarLi utilise le gestionnaire de paquets gratuit et open-source **Conda**.

**Si vous n'avez pas Conda**, nous vous recommandons vivement de l'installer avec **Miniforge**.

Vous pouvez **télécharger** et **installer** la dernière version de **Miniforge** spécifique à votre système d'exploitation depuis le dépôt git : [Conda-forge / Miniforge](https://github.com/conda-forge/miniforge).

!!! warning
    Nous vous recommandons fortement de **redéfinir les canaux par défaut** de votre distribution conda et de la **mettre à jour** régulièrement !  
    Lire pourquoi: [Éviter les Pièges de la Licence Anaconda : Guide Pratique](https://mivegec.pages.ird.fr/dainat/malbec-fix-conda-licensing-issues/fr/).

!!! shell
    _Exemple de script pour les systèmes Linux\_x86\_64 bits ou Sous-système Windows pour Linux (WSL)_
    ```shell
    # Téléchargement
    curl -L -O https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh
    
    # Installation
    bash ./Miniforge3-Linux-x86_64.sh -b -p ~/miniforge3/
    
    # Nettoyage
    rm -f ./Miniforge3-Linux-x86_64.sh
    
    # Configuration
    ~/miniforge3/condabin/conda config --add channels bioconda
    /miniforge3/condabin/conda config --add channels conda-forge
    ~/miniforge3/condabin/conda config --set channel_priority strict
    ~/miniforge3/condabin/conda config --set auto_activate_base false
    
    # Mise à jour
    ~/miniforge3/condabin/conda update conda --yes
    
    # Contrôle l'installation
    ~/miniforge3/condabin/conda --version
    ~/miniforge3/condabin/conda config --show channels
    
    # Initialisation
    ~/miniforge3/condabin/conda init
    ```
	
!!! tip
    Si vous avez besoin d'aide, vous pouvez utiliser ce script annexe : [Install_Conda-with-Miniforge3.sh](https://forge.ird.fr/transvihmi/nfernandez/install_conda-with-miniforge3)


## **GeVarLi**

!!! warning
    **Présumant que Conda est installé**

Vous pouvez **télécharger** GeVarLi en tant que fichier zip depuis le dépôt git : [IRD-Forge / GeVarLi](https://forge.ird.fr/transvihmi/nfernandez/GeVarLi).

<div style="text-align: center;">
  <img src="../../../images/download_button.png" width="400" height="800">
</div>

!!! shell
    _Exemple de script pour télécharger GeVarLi dans votre répertoire ```/home/```_
    ```shell
    # Téléchargement
    curl https://forge.ird.fr/transvihmi/nfernandez/GeVarLi/-/archive/main/GeVarLi-main.tar.gz -o ~/GeVarLi-main.tar.gz
    
    # Untar
    tar -xzvf ~/GeVarLi-main.tar.gz
    
    # Nettoyer l'archive
    rm -f ~/GeVarLi-main.tar.gz
    
    # Renomer le répertoire
    mv ~/GeVarLi-main/ ~/GeVarLi/
	
	# Se déplacer dans le répertoire GeVarLi
	cd ~/GeVarLi/
    ```

!!! tip
    Sinon, vous pouvez aussi **cloner** et **mettre à jour** à jour GeVarLi.
    
	_Exemple de script pour le cloner et le mettre à jour, dans votre répertoire ```/home/```_
    ```shell
    # Cloner
    git clone --depth 1 https://forge.ird.fr/transvihmi/nfernandez/GeVarLi.git ~/GeVarLi/
    cd ~/GeVarLi/
    
    # Mise à jour avec un 'git pull' (présumant que vous êtes dans le répertoire GeVarLi/)
    git reset --hard HEAD && git pull --depth 1 --verbose
    ```
