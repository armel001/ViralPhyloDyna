# **Installations**

## **Conda**

!!! warning
    **Dependency required**

GeVarLi use the use the free and open-source package manager **Conda**.

**If you don't have Conda**, we hihly recommad to installed it with **Miniforge**.

You can **download** and **install** the latest version of **Miniforge** for your specific OS from the git repository: [Conda-forge / Miniforge](https://github.com/conda-forge/miniforge/releases).

!!! warning
    We higly recommand to **reset default channels** of yours conda distribution and to **update** it regulary!  
    Read why: [Avoiding the Pitfalls of the Anaconda License](https://mivegec.pages.ird.fr/danat/malbec-fix-conda-licensing-issues/en/).

!!! shell
    _Example script for Linux\_x86\_64-bit** or Windows Subsystem for Linux (WSL) systems_
    ```shell
    # Download
    curl -L -O https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh
    
    # Install
    bash ./Miniforge3-Linux-x86_64.sh -b -p ~/miniforge3/
    
    # Clean
    rm -f ./Miniforge3-Linux-x86_64.sh
    
    # Configure
    ~/miniforge3/condabin/conda config --add channels bioconda
    /miniforge3/condabin/conda config --add channels conda-forge
    ~/miniforge3/condabin/conda config --set channel_priority strict
    ~/miniforge3/condabin/conda config --set auto_activate_base false
    
    # Update
    ~/miniforge3/condabin/conda update conda --yes
    
    # Check install
    ~/miniforge3/condabin/conda --version
    ~/miniforge3/condabin/conda config --show channels
    
    # Init
    ~/miniforge3/condabin/conda init
    ```

!!! tip
    If you need help, you can use this side script: [Install_Conda-with-Miniforge3.sh](https://forge.ird.fr/transvihmi/nfernandez/install_conda-with-miniforge3)


## **GeVarLi**

!!! warning
    **Given that Conda is installed**

You can **download** GeVarLi as zip file from the git repository: [IRD-Forge / GeVarLi](https://forge.ird.fr/transvihmi/nfernandez/GeVarLi).

<div style="text-align: center;">
  <img src="../../../images/download_button.png" width="400" height="800">
</div>

!!! shell
    _Exemple script to download GeVarLi to your ```/home/``` directory_
    ```shell
    # Download
    curl https://forge.ird.fr/transvihmi/nfernandez/GeVarLi/-/archive/main/GeVarLi-main.tar.gz -o ~/GeVarLi-main.tar.gz
    
    # Untar
    tar -xzvf ~/GeVarLi-main.tar.gz
    
     # Clear
     rm -f ~/GeVarLi-main.tar.gz
     
     # Rename
     mv ~/GeVarLi-main/ ~/GeVarLi/
	 
	 # Move
	 cd ~/GeVarLi/
```

!!! tip
    Otherwise, you can also **clone** and **update** GeVarLi.
	
    _Exemple script to clone and update it, to your ```/home/``` directory_
    ```shell
    # Clone
    git clone --depth 1 https://forge.ird.fr/transvihmi/nfernandez/GeVarLi.git ~/GeVarLi/
    cd ~/GeVarLi/
    
    # Update using 'git pull' (given you are into GeVarLi/ repository)
    git reset --hard HEAD && git pull --depth 1 --verbose
    ```
