�Z3ENV  �s`1`!  "!�[6 #�* �� "��N �6�SINSTALOS V1.2b   Copyright (C) 1988/89/90   H.F. Bower / C.W. Cotrill
 !� ~##��_��_~�/#~�_�/( �A�X�T�@�_��

INSTALOS patches a user's MOVCPM.COM "type" program with
             replacement CCP, DOS and BIOS segments.

  Syntax:
        INSTALOS [/o] <cr>
  Options:
        // - Print this message
        /A - Overlay existing relocated image
               (Absolute Addressing from image)
        /T - Overlay ZSDOS/ZDDOS on TURBOSYS.MDL
  Notes:
      1 - Operation is interactive, screen oriented under ZCPR3
      2 - Replacement segments must be in Microsoft .REL form
      3 - Default setting of ZSDOS/ZDDOS parameters is supported
          during installation of the DOS segment.
      4 - Drive/User filespecs (DU:) are allowed.

 �� *	"*	"* 	" 2�x2��}#"��Y!�C�:��A ;�SAbsolute System Model (Default=SYSTEM.MDL) :  �8!j~�T <�STurboRom system file (Default=TURBOSYS.PRL) :  �8!3>�SSystem Image file to patch (Default=MOVCPM.COM) :  �8!(͊\ ͌!�O�S
Loading..  ́� *�"��͞!\ ͔!ѷ *��\ ͂!! "��*�"��v��~�� ###~��(� 2�*�� "���	~�� �++++++�"�� ��!�#� 	#�>�2�� 	"�~�� � 	~�� �###�*�$"� "� "�:��A(d�[� "��v�k~���$(�  :��  *�"�� "�~� �#:��� �~˯� ��"�>$� �###� �#�~(�0*� ~#V�0 �S��S! �"�"! "�" �<:��A�<*��[���R$"� "��"�*�|�G��%.�[�"�^#V�S�$. :�� {�(=*�%���
++ Image Vector does not match Calculations ++ ì�[�*��o�R"�!�#�:>-<�L"��S1 - Replace CCP �S2 - Replace DOS �S3 - Replace BIOS �S4 - Save and Exit �S
Enter Selection (^C Quits) :  �Ͳ�ʬ�L"�2���3�,�4��1 �� �SName of ZCPR file (Default=ZCPR3.REL) :  ��8��!!T͊\ ͨ!�p! ��������/�"��C�	��R�5	!�Q] �	"�� Size Ok...overlaying CCP.. \ ͨ!���:��A �K�*�	�>�[�! ��  :��G�[�*�>��K�*�	����â� �SName of DOS file (Default=ZSDOS.ZRL) :  ��8��!!>͊\ ͨ!�p! ��������/�"��C�	��R8&�S*** File too large to fit... ì!�Q] �	"�� Size OK...overlaying BDOS.. \ ͨ!���:��A¡	�K�>�[�!��� :��G>*�	�*���K�*�	����*�c ~�Z�#~2��S(�D�#~�D�#~�O�#~�S��SExamine/Change ZSDOS parameters ([Y]/N)? :  Ͳ�ʬ�L"�N��6*�|� "��
No Z3 Environment Found
 ��
��(Z3 Environment at  :  *��K��!- /�S(ZCPR Path Address  :  	 *�^#V�"��K!-���!��Q��Wheel Byte at :  ) *�^#V�"��K��!�*� ��"��^�V�S���!��!�Q��       1 - PUBlic Files           :  �*��� F���� ,��
       2 - Pub/Path Write Enable  :  *��
       2 - Public Write Enable    :  �*��� N����
       3 - Read-Only Vector       :  �*��� V����
       4 - Fast Fixed Disk Log    :  �*��� ^����
       5 - Disk Change Warning    :  �*��� f�����$��
       6 - Path w/o System Attr   :  �*��� v����
       7 - DOS Search Path        :  �*��� n(Q��Enabled ! ���*��n��f���R �� - Internal *��  Addr =  �*��n��f��B��Disabled ���
       8 - Wheel Byte Protect     :  �*��n��f�|�( ���Enabled  Addr =  ��B���Disabled..Assumed ON ���
       T - Time Routine (Clock)   :  �*��n�f�!��
       A - Stamp Last Access Time :  �*��n�f��(�:�!��
       C - Stamp Create Time      :  �*��n�f�!��
       M - Stamp Modify Time      :  �*��n�f��(�q�!��
       G - Get Date/Time Stamp    :  �*��n	�f
�!��
       S - Set Date/Time Stamp    :  �*��n�f�!��!!�Q���Entry to Change ("X" if Finished) :  �Ͳ�ʬ� 8��L"�X��1��2��3��4��5����?�6@��7�?�SPath [(D)isable, (S)et, (I)nternal *�|�(��, (Z)CPR3 ��] :  Ͳ�L"�D(E�Z(L�� �I 	�! I�S ��*��� ��SEnter PATH Address :  !  ͸�*��� ��
�*�*�|��
*��*��t��u��� ��
�8���SWHEEL Addr [(D)isable, (S)et *�|�(��, (Z)CPR3 ��] :  Ͳ�L"!  �D(7�Z((�S ��SEnter WHEEL Address :  !  ͸*�|��
*��*��t��u��
�T ,�STime (Clock) �Y�*��u�t>�� �w�w�
�A 4�SStamp Last Access Time ����Y�ĺ�*��u�t�
�� +�C '�SStamp Create Time �Y�*��u�t�
�M /�SStamp Modify Time ����Y�ĺ�*��u�t�
�� P�G $�SGet Time Stamp �Y�*��u	�t
�
�S $�SSet Time Stamp �Y�*��u�t�
��  �0x�*�ݮ �w �
�6�[�!� ��:��A�<â� :��T 9�SDANGER -- Do you Really want this (Y/[N])?  Ͳ�Y¢�SName of BIOS file (Default=CBIOS.REL) :  ��8��!!_͊\ ͨ!�p! ��������/�"��C�:��Aʂ	]T�K���B}�($. |�ʂ"��*��[��_�R"��kb	��x�K� �	�	�����x� ���!��[�~�w#~�w#�*��*�s#r*��<��<��<��[�}�(}�o� "��SRelocated map by :  *��+" !�Q:��A(] �	"�� Size Ok  ��..overlaying BIOS.. �[�*���\ ͨ!���:��A �K�>
 :��G>*�	�*���K�*�	����:��ʢ*��[��[�$. "�â�6:��T X�SLocation to save TURBOSYS.PRL (Default= �K�x�A�L"y��
0��
Ox�(�0�L"y�0�L">:�L"L�SName to save new system (Default= :�� ��MOVZSDOS.COM ��ZSSYS.MDL ��) :  ��8:�!u�A(
!3�T(!I͊� �K��D!\ �p!(O�S--- That file already exists.  Overwrite it (Y/[N])?  Ͳ�L"�Y(�\ ͇!�S..Saving  ́\ �w!<ʢ*��[���R�l& �j"��͞!�\ ͙!�� �*�+"�|�� �\ ͂!<ʗ�S
Returning to system... �K��D!�{`�:��Aȯ�RMDkbw��ɯ!�b���\ ͂!����\ ͌!� H>�2����:���8)����������!� ͞!\ ͔!�����������7�L_ !� <2�~������
*** Unable to open  [��
*** Cannot find legal Relocation Bit Map
 �:ì��
*** No Directory Space for 
 ́ì��
*** Can't find CCP/BDOS/BIOS at standard locations !!! Ñ���
*** Error in .REL file :  ^�� #��
*** Error Reading REL File ;���
*** Error in .REL sizing  ́��    Err Code :  ��6"��!ì��
*** Error writing file.  Try again with another disk (Y/[N])? :  Ͳ�L"�Y¬\ ͂!��S
---Can't find  ] �	"��.. reenter (Y/[N]) :  Ͳ�L"�Y¬!�Q���
Addresses in system image  :��A(��(as seen under DDT)  ��:

     CCP :  :��A(*��K��        Map @  *��K��
     BDOS:  :��A(*��K��        Map @  *��K��
     BIOS:  :��A(*��K��        Map @  *��K��!!�|�0��Q��$���Q!�6#6 +>�ͼ!\ ͨ!!] 6 #�!�\ �g"�[�x< By< K�C��D!��[���R��] �	"��!] � (�?  ��e  	� (�?� ���� "�S#�S#2�����0�:��L"���� "��0���
���
8�����))))�o�(
��YES ���NO  ��[���R( ��Enabled ��[���R(�B���Disabled ��$�K�,�+">H�L"��!���� Routine [(D)isable), (S)et] :  Ͳ�L"�D(+�S ��SEnter Address of Routine :  !  ø*�7��� Routine [(D)isable), (E)nable] :  Ͳ�D(��E ��*��n�f��O:��Sy��_CCP_�    _DOS_�   _BIOS_�  �ZRDOSMOVCPM  COMTURBOSYSPRLZSDOS   ZRLMOVZSDOSCOMZCPR3   RELCBIOS   RELSYSTEM  MDLZSSYS   MDL                                                                                                                                                                                                                                  "�#��������C�#!�#6 #��"�#"�#��S�#�!�#�w �s�#�H �� F �� ~�+�H �v��H �H(4�e�*�#	}��y�|��s��H 
�e�*�#��e�*�#��[�#��ͥ�(o�(q�(g�(`�(\�
(<�ʨ�(?8�� N(:�#�(�<�8�*�#s��[�#�K�#��{�#�����>�!>���\"�#�� �
�\"�#�� �͸Ú�\�'Ú�'�*�#�#�� � #�� ��~  ^#V�S�#���~ 
 ����Ú�\�� N(:�#�<�_(�*�#s�*�#:�#��A�K�#�8 C�� N(�[�#�K�#]T	������ ��� N(-}�2�#�<���[�#"�#G�~(�_�[�#�� �����Ú�ͬW�!�# 6 #��ͪ�w#� �6���G�O>��,x�yɯͬ2�#ͪͪgo"�#�7ͪ��� F��� ~�>�w �#�� N��!�#4�^�6 *�#s#"�#^���H7 ? ���� n��� v��� ������������~#�?���(�(�(�(�G"�0���$��,����K������V#^#���Q�����:�#*�#�=���[�#���[�#��k�*�#:�#�W~�(�	 ������*�#�����[�#�(�t:�#� �������(��v�%-���%(�\ �L"��S#�D(L�2(C�3(;�.(+�+(*�>(�R(�I(�N ү�$,�}lg��0�g�|��L"e�| |d��
���0��/�0��Gz�0 �A(�L"x��~�(#�\ ~#�L"�z�����O*�#|�(�+ �~�(G��@ � ������F ���� �����"�#|�(� "�#�|�(D~�!8?� ~2�##~2�##~2�# �# ���� ��:�#O	���� � �������� !�#6 #�s#r#�6 #s#r#�6 #�� �����s#r#�~#���\ �#�"�#�|�� >Z�� ��"!�(* >�O>��G>Z��  �!���"!�� ��|�� @!����(!���! ~��#~��3ENV����Y ��!X��!����������!�� ��!O�G����>��!<�͇!>��!���>Î!>Î!>��!���>��!>��!�>���!������� rr# ����������
� �#~#�_ 6 ���W"��+~#����� �ѷ����O� ������>�L">
�L"���>�^#�������">.�L"�"������ �L"���|�6"}�6"����p#�L"���t#�L"������O>�^#�����~�(�S#w#��������C�#$կ�*#��~#�:(
�,(U�!8Q��~�S#�A8�A�8���<2�##~�:(4�? 2�##~�:('�G~#�:(�08��
0�Ox�����G�x� 0�2�#�~�: #~�,(�!0>?�*#�K�#�����#~�. #�#��(#��/#(�* >?#��/#�#�> ��~�S#���!8�=��_��.��:��;��,��<��>ɾ���a��{��_����f#����o��* o���Ɛ'�@'���*�#� j����#                                                                                                                    