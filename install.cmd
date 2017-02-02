@ECHO OFF
TITLE "QCoDeS Installer"
ECHO "Installing python, may take a while."
:: install local anaconda silently in the default location, register as system python and add to path 
start /wait "Python Installer" Miniconda3-latest-Windows-x86_64 /S /D=%UserProfile%\Anaconda3
:: upgrade default conda (will also update it self) possilby too clever
CALL %UserProfile%\Anaconda3\Scripts\conda upgrade --all -y 
CALL %UserProfile%\Anaconda3\Scripts\conda create -y -n qcodes-qdev-master python=3.5
CALL %UserProfile%\Anaconda3\Scripts\activate qcodes-qdev-master
CALL %UserProfile%\Anaconda3\Scripts\conda install -y h5py
CALL %UserProfile%\Anaconda3\Scripts\conda install -y matplotlib
call %userprofile%\anaconda3\envs\qcodes-qdev-master\scripts\pip install pyqtgraph
ECHO "Installing final bits.."
CALL %UserProfile%\Anaconda3\envs\qcodes-qdev-master\Scripts\pip install git+https://github.com/qdev-dk/Qcodes.git
ECHO "DONE, close window if"
