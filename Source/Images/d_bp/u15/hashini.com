�Z3ENV  HASHINI   ��sn
1n
�	ͧ��!�2�	�<	
Initialize Volume Label and File Stamps   Ver 0.2   12 Sep 93
 � 2�	�4>1n
�<	

Initialize another Disk?  (Y/[N]) :  ��Y�/���}	��2�	!�	u�6:�	�(m�<	

Initialize which Disk for  :�	� �<	P2DOS 
�<	NZTIME �<	 Date/Time Stamps? :  ��A8�Q8
�<	  �2�	:�	� A�<	
Enter Volume Name [1-11 chars] :  !� 6�2� =�	~�(��	~��� �:�	�(@�<	
     Confirm Initialize Drive  :�	͞	�<	: (Y/[N])  ��Y�:�	�A�_��<	
+++ Existing Files will be ERASED! +++
 --- Proceed anyway (Y/[N]) :  ��Y��O�K|���^#V�S�		 ^#V�����	�V�^�S�	�:��:��S�	  !� ���	�`(6 # �(Oq#��6@>��7:�	�>!(>�w#�6���<
...Writing Initialized Directory...   �S�	̓!� >� �7̓*�	�[�	��R � �i��2�	�<	

Illegal drive name �<	
Usage: Set Drive Volume Name & Initialize for P2Dos/NzTime file stamps

Syntax:
	 �p�<	 [d:][volname] [/][P | Z | Q]
Examples:
	 �p�<		- Enter Interactive Mode
	 �p�<	 /P	- Init Drive interactively w/P2D stamps
	 �p�<	 d:	- Initialize drive "d" w/default Stamp
	 �p�<	 d:name	- Init drive "d" adding Vol ID "name"
			   file with default Stamps
	 �p�<	 d: ZQ	- Init drive "d" for NZTime Stamps
			   suppressing unneeded messages
	 �p�<	 //	- Display this message

Note: ZCNFG may be used to configure a flag to suppress
      drive confirmation prompt and status messages
 �:
����<	HASHINI ����!  �K�	�V�^ >��R?8���=(�����f�n	DM�Q��[�	�oDM�W� �]  �i�(�<	
Directory write error  �K�	�C�	����:�	O � �K�� ��:�	�@G7!  �j��%� :�	��{n
ɯ2�	2�	!\ ~�(	�@�Q02�	#~�	� (�/ #���~� (#��!m ~�/ #���͗�!\ ~�(#~�  
:m �  ��ɯ�~�Q 
:�	��2�	�P �2�		�Z ��2�	#~� (�	( Я�:�	�>̞	�<	
+++ Unrecognized Option " ~͞	�<	" ... Setting Interactive ���͊	��/��/�a��{��_� ~#�ɯw#��:�	��<	�~#� ���� $� � �! �$ �' �-  ��* 	���      !!!TIME&DAT                        !�~������(# ������        ��ͧ(~�� (͞	#�����$ ���" *p
|�(~#fo�����( *p
|��	���*p
|�(~���"p
������
� �#~#�_ 6 ��ĩ	��+~#����B	���� ~#� ����	(͞	�(��
(	�(� ��D	�y/�<G> ͞	���>͞	>
͞	��͐	ù	�>��	�������O>��	�����~�(͹	w#������a��{��_�����	����o��* o����*�	� j���r
                           