@Echo off
Rem ***************************************************************
Rem * �o�b�`���FHyper-V�@�\��ON�ɂ���R�}���h�o�b�`
Rem * �������e�FHyper-V�@�\���R�}���h���C������ON�ɂ��܂�
Rem ***************************************************************

Rem ---------------------- ���C���������� ---------------------- 
Rem �^�C�g���\������
Call :DisplayTitle

Rem Hyper-V�̋@�\��ON�ɂ���
Call :RunEnableHyper-V

Rem �I������
Call :EndProcess

Rem ---------------------- ���x���������� ---------------------- 

Rem ***************************************************************
Rem * �� �� ���F�^�C�g���̕\��
Rem * ��    ���F�Ȃ�
Rem * �������e�FHyper-V�@�\��ON�ɂ���R�}���h�o�b�`�̃^�C�g����\
Rem *           ������
Rem ***************************************************************
:DisplayTitle

    Call :DisplayNewLine
    Call :DisplayMessage "*************************************************************** " 0 0
    Call :DisplayMessage "* �o�b�`���FHyper-V�@�\��ON�ɂ���R�}���h�o�b�`                 " 0 0
    Call :DisplayMessage "* �������e�FHyper-V�@�\���R�}���h���C������ON�ɂ��܂�           " 0 0
    Call :DisplayMessage "*************************************************************** " 0 0
    Call :DisplayNewLine
    
    Exit /b

Rem ***************************************************************
Rem * �� �� ���FHyper-V�̋@�\��ON�ɂ���R�}���h�����s
Rem * ��    ���F�Ȃ�
Rem * �������e�F�uBCDEdit�v�R�}���h���g�p����Hyper-V�@�\��ON�ɂ���
Rem *           �R�}���h�����s����
Rem ***************************************************************
:RunEnableHyper-V

    Rem ���s����R�}���h����ʂɕ\���A���[�U�[�ɏ����̑��s��Θb
    Call :DisplayMessage "���L�̃R�}���h�����s����Hyper-V�@�\��ON�ɂ��܂� " 0 0
    Call :DisplayMessage "bcdedit /set hypervisorlaunchtype auto          " 0 1
    Pause

    Rem �uBCDEdit�v�R�}���h���g�p����Hyper-V�̋@�\��ON����
    Call :DisplayNewLine
    bcdedit /set hypervisorlaunchtype auto
    Call :DisplayNewLine

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

    Call :DisplayMessage "Hyper-V�@�\��ON���܂����I�I          " 0 0
    Call :DisplayMessage "�ċN�������邱�ƂŐݒ肪���f����܂� " 0 1
    Pause

    Rem �����̏I��
    Exit
        