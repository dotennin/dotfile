Echo off

Rem For�����̒l��ω������邽�߂̐錾�i�x�����ϐ��j
Setlocal enabledelayedexpansion

Rem ***************************************************************
Rem * �o�b�`���FHyper-V�@�\��ON�EOFF�ɂ���o�b�`
Rem * �������e�FHyper-V�@�\�̌��݂̏�Ԃ�\�����AHyper-V�@�\��ON�EOFF
Rem *           �̂ǂ�������s���邩���[�U�[�ɑΘb���đI�����Ă��炤
Rem *           Hyper-V�@�\�̕ύX��͍ċN�����邩�ǂ������[�U�[�ɑ�
Rem *           �b���Ď��s����
Rem ***************************************************************

Rem --------------------------- �ݒ� --------------------------- 
Rem Hyper-V�̌��݂̏�Ԃ�\������bat�t�@�C����
Set NowHyper-VStatusBat=04_CheckHyper-V-Status.bat

Rem ---------------------- ���C���������� ---------------------- 
Rem �^�C�g���\������
Call :DisplayTitle

Rem �J�����g�f�B���N�g����bat�t�@�C���̎��s���ꂽ�f�B���N�g���ɕύX
Call :ChangeRunBatDir

Rem Hyper-V�@�\�̌��݂̏�Ԃ�\��
Call :DisplayHyper-VStatus

Rem ���sbat�t�@�C����I�����܂�
Call :ChooseRunBatFile

Rem �I���������sbat�t�@�C�����Ǘ��҂Ŏ��s����
Call :RunBatFileAsAdmin

Rem �ċN�����s�����ǂ������[�U�[�ɑΘb
Call :IsReStart

Rem �I������
Call :EndProcess

Rem ---------------------- ���x���������� ---------------------- 

Rem ************************************************************************
Rem * �o�b�`���F�^�C�g���̕\��
Rem * ��    ���F�Ȃ�
Rem * �������e�FHyper-V�@�\��ON�EOFF�ɂ���o�b�`�̃^�C�g����\�����܂�
Rem ************************************************************************
:DisplayTitle

    Call :DisplayNewLine
    Call :DisplayMessage "  ****************************************************************** " 0 0
    Call :DisplayMessage "  * �o�b�`���FHyper-V�@�\��ON�EOFF�ɂ���o�b�`                       " 0 0
    Call :DisplayMessage "  * �������e�FHyper-V�@�\�̌��݂̏�Ԃ�\�����AHyper-V�@�\��ON�EOFF  " 0 0
    Call :DisplayMessage "  *           �̂ǂ�������s���邩���[�U�[�ɑΘb���đI�����Ă��炤   " 0 0
    Call :DisplayMessage "  *           Hyper-V�@�\�̕ύX��͍ċN�����邩�ǂ������[�U�[�ɑ�    " 0 0
    Call :DisplayMessage "  *           �b���Ď��s����                                         " 0 0
    Call :DisplayMessage "  ****************************************************************** " 0 0
    Call :DisplayNewLine
    
    Exit /b

Rem ***************************************************************
Rem * �� �� ���F�J�����g�f�B���N�g����bat�t�@�C�������s���ꂽ�f�B��
Rem *           �N�g���ɕύX����
Rem * ��    ���F�Ȃ�
Rem * �������e�F�ucd�v�R�}���h�����s���ăJ�����g�f�B���N�g����bat
Rem *           �t�@�C�������s���ꂽ�f�B���N�g���ɕύX����
Rem ***************************************************************
:ChangeRunBatDir

    Call :DisplayMessage "�����݂̃f�B���N�g����bat�t�@�C�������s�����f�B���N�g���ɕύX���܂��c�c" 1 0

    Rem �J�����g�f�B���N�g����bat�t�@�C�������s�����t�H���_�ɕύX
    cd /d %~dp0
    Exit /b

Rem ***************************************************************
Rem * �� �� ���FHyper-V�̋@�\�̌��݂̏�Ԃ���ʂɕ\������
Rem * ��    ���F�Ȃ�
Rem * �������e�F�Ǘ��҂Ŏ��s���Ȃ���Hyper-V�̌��݂̏�Ԃ��擾�ł���
Rem *           ���̂�powershell���g�p���ĕʂ̃R�}���h�v�����v�g��
Rem *           �Ǘ��҂Ŏ��s����Hyper-V�̌��݂̏�Ԃ�\������
Rem ***************************************************************
:DisplayHyper-VStatus

    Call :DisplayMessage "��Hyper-V�̌��݂̏�Ԃ�\�����܂��c�c" 1 0

    Rem Hyper-V�@�\�̌��݂̏�Ԃ�powershell���g�p���ĕʂ̃R�}���h�v�����v�g��
    Rem �Ǘ��҂Ŏ��s���ĕ\������
    powershell start-process %NowHyper-VStatusBat% -verb runas

    Call :DisplayNewLine

    Exit /b

Rem ***************************************************************
Rem * �� �� ���F���sbat�t�@�C���̑I��
Rem * ��    ���F�Ȃ�
Rem * �������e�F���s�Ώۂ�bat�t�@�C����I�����܂�
Rem *           Hyper-V��ON�ɂ��邩OFF�ɂ��邩�̂ǂ��炩��bat�t�@
Rem *           �C�������[�U�[�ɑΘb���đI�����Ă��炤
Rem ***************************************************************
:ChooseRunBatFile

    Call :DisplayMessage "�����sbat�t�@�C����I�����܂��c�c" 0 1

    Rem ����bat�t�@�C���̃t�H���_����command�Ɩ��̂�bat�t�@�C���̈ꗗ��\��
    Set FileListCounter=0
    For /f %%i In ('Dir *command* /b') Do (

        Rem Hyper-V�@�\��ON�EOFF�ɂ���bat�t�@�C����\�����܂�
        Set /a FileListCounter=FileListCounter+1
        Echo !FileListCounter!�F�u%%i�v

    )

    Rem ���sbat�t�@�C����I��
    Call :DisplayMessage "���s����bat�t�@�C���̔ԍ�����͂��ĉ������i1�`!FileListCounter!�j" 1 0
    Set /p TargetFileNo="���s����bat�t�@�C���ԍ��̓��́@���@"

    Rem ���sbat�t�@�C���̕\��
    Set ChooseFileNoCounter=0
    For /f %%i In ('Dir *command* /b') Do (
    
        Set /a ChooseFileNoCounter=ChooseFileNoCounter+1
        
        Rem ���sbat�t�@�C���̔ԍ��ƈ�v������
        If !ChooseFileNoCounter! Equ %TargetFileNo% (
        
            Rem �t�@�C�������Z�b�g����
            Set TargetFileName=%%i
            
        )
    )
    
    Rem ���sbat�t�@�C���̕\��
    Call :DisplayMessage "���sbat�t�@�C�����F%TargetFileName%" 1 0

    Rem ���sbat�t�@�C���������͂̎��i�s���Ȓl����͂������j
    Rem ��������x�A�u���sbat�t�@�C���̑I���v���������s����
    If "%TargetFileName%" Equ "" (

        Call :DisplayMessage "�G���[�F���sbat�t�@�C�������擾�ł��܂���ł����B�u1�`!FileListCounter!�v�œ��͂��ĉ������B" 1 0
        Call :ChooseRunBatFile

    ) 

    Exit /b

Rem ***************************************************************
Rem * �� �� ���F�Ǘ��҂�bat�t�@�C�������s����
Rem * ��    ���F�Ȃ�
Rem * �������e�Fpowershell���g�p����bat�t�@�C����ʂ̃R�}���h�v����
Rem *           �v�g���Ǘ��҂Ŏ��s����
Rem ***************************************************************
:RunBatFileAsAdmin

    Call :DisplayMessage "���I�����ꂽbat�t�@�C�������s���܂��c�c" 1 0

    Rem bat�t�@�C����powershell���g�p���ĕʂ̃R�}���h�v�����v�g���Ǘ��҂Ŏ��s���ĕ\������
    Rem ���Ǘ��҂łȂ��Ǝg�p�ł��Ȃ��R�}���h���g�p���邽��
    powershell start-process %TargetFileName% -verb runas

    Call :DisplayNewLine

    Exit /b

Rem ***************************************************************
Rem * �� �� ���F�ċN�����邩�ǂ������[�U�[�ɑΘb
Rem * ��    ���F�Ȃ�
Rem * �������e�F�ċN�����邩�ǂ��������[�U�[�ɑΘb�����ʂ�ϐ���
Rem *           �Z�b�g����
Rem ***************************************************************
:IsReStart

    Rem �����𑱍s���邩���[�U�[�ɑΘb
    Rem ����Enter����Ɨ����邽�߁A�\�ߓK���Ȓl���Z�b�g���Ă���
    Call :DisplayMessage "���L���b�Z�[�W��(�uY�v���́uy�v)�ȊO�͏������I�����܂��c�c" 0 0
    Set RunReStartResult=KaraMojiTaiou
    Set /p RunReStartResult="�ċN�������s���܂����H(y/n)�@���@"

    Rem �啶��/�������ϊ�(Y�ȊO�͑S�ăL�����Z������) 
    Set RunReStartResult=%RunReStartResult:y=Y%%

    Exit /b

Rem ***************************************************************
Rem * �� �� ���F���b�Z�[�W�̕\��
Rem * ��    ���F1 �\�������郁�b�Z�[�W
Rem *           2 �\�������郁�b�Z�[�W�O�ɉ��s���܂߂邩�ǂ����i1�͊܂߂�A����ȊO�͊܂߂Ȃ��j
Rem *           3 �\�������郁�b�Z�[�W��ɉ��s���܂߂邩�ǂ����i1�͊܂߂�A����ȊO�͊܂߂Ȃ��j
Rem * �������e�F�\�������郁�b�Z�[�W�̑O��ɉ��s���܂߂ĕ\�����邩
Rem *           �ǂ����������ɉ����čs��
Rem *           �g�p���@
Rem *             Call :DisplayMessage "�������� aaaaa bbbbb" 1 1
Rem *             �������͕K��3�n������
Rem *               �\�����郁�b�Z�[�W�͕K���_�u���N�H�[�e�[�V�����ň͂ނ���
Rem ***************************************************************
:DisplayMessage

    Rem ���b�Z�[�W�O�ɉ��s���܂߂�
    If %~2 Equ 1 (
        Call :DisplayNewLine
    ) 

    Rem �_�E�u���N�H�[�e�[�V�������폜���ĕ\��
    Echo %~1

    Rem ���b�Z�[�W��ɉ��s���܂߂�
    If %~3 Equ 1 (
        Call :DisplayNewLine
    )
    
    Exit /b

Rem ***************************************************************
Rem * �� �� ���F���s���b�Z�[�W�̕\��
Rem * ��    ���F�Ȃ�
Rem * �������e�F�R�}���h�v�����v�g�ɉ��s��\��������
Rem ***************************************************************
:DisplayNewLine

    Rem ���s��\��
    Echo;
    
    Exit /b

Rem ***************************************************************
Rem * �� �� ���F�I������
Rem * ��    ���F�Ȃ�
Rem * �������e�F�o�b�`�������I��������
Rem ***************************************************************
:EndProcess

    If /i %RunReStartResult%==Y (

        Rem �ċN�������s���ď������I������
        Call :DisplayMessage "���ċN�������s���ď������I�����܂��c�c" 1 1
        pause
        shutdown.exe /r /t 0        
        Exit
    )

    Rem �ċN�������s���Ȃ��ŏI������
    Call :DisplayMessage "���ċN�������s���Ȃ��ŏ������I�����܂��c�c" 1 1
    pause
    Exit
