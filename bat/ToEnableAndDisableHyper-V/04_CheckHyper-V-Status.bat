@Echo off
Rem ***************************************************************
Rem * �o�b�`���FHyper-V�@�\�̌��݂̏�Ԃ��m�F����R�}���h�o�b�`
Rem * �������e�FHyper-V�@�\�̌��݂̏�Ԃ��m�F�ɂ��܂�
Rem ***************************************************************

Rem ---------------------- ���C���������� ---------------------- 
Rem �^�C�g���\������
Call :DisplayTitle

Rem Hyper-V�̌��݂̏�Ԃ�\��
Call :RunCheckHyper-VStatus

Rem �I������
Call :EndProcess

Rem ---------------------- ���x���������� ---------------------- 

Rem ***************************************************************
Rem * �� �� ���F�^�C�g���̕\��
Rem * ��    ���F�Ȃ�
Rem * �������e�FHyper-V�@�\�̌��݂̏�Ԃ��m�F����R�}���h�o�b�`�̃^
Rem *           �C�g����\������
Rem ***************************************************************
:DisplayTitle

    Call :DisplayNewLine
    Call :DisplayMessage "*************************************************************** " 0 0
    Call :DisplayMessage "* �o�b�`���FHyper-V�@�\�̌��݂̏�Ԃ��m�F����R�}���h�o�b�`     " 0 0
    Call :DisplayMessage "* �������e�FHyper-V�@�\�̌��݂̏�Ԃ��m�F�ɂ��܂�               " 0 0
    Call :DisplayMessage "*************************************************************** " 0 0
    Call :DisplayNewLine
    
    Exit /b

Rem ***************************************************************
Rem * �� �� ���FHyper-V�̋@�\�̌��݂̏�Ԃ��m�F����R�}���h�����s
Rem * ��    ���F�Ȃ�
Rem * �������e�F�uBCDEdit�v�R�}���h���g�p����Hyper-V�@�\�̌��݂̏�
Rem *           �Ԃ��m�F����R�}���h�����s�����̏�Ԃ������Ӗ�����
Rem *           ����̂���ʂɕ\������
Rem ***************************************************************
:RunCheckHyper-VStatus

    Rem �uBCDEdit�v�R�}���h���g�p����Hyper-V�̋@�\�̌��݂̏�Ԃ��m�F����R�}���h�����s����
    Call :DisplayMessage "Hyper-V�@�\�̌��݂̏�Ԃ�\�����܂��c�c " 0 1
    bcdedit /enum | find "hypervisorlaunchtype"
    Call :DisplayNewLine

    Rem Hyper-V�@�\���ǂ�ȏ�ԂȂ̂������������e����ʂɕ\������
    Call :DisplayMessage "��Hyper-V�@�\�̏�Ԑ����� " 0 0
    Call :DisplayMessage "Auto�FHyper-V�@�\��ON     " 0 0
    Call :DisplayMessage "Off �FHyper-V�@�\��OFF    " 0 0
    Call :DisplayNewLine
    Pause

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

    Rem �����̏I��
    Exit
        