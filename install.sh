#!/usr/bin/bash
shopt -s extglob
# Regref installer
# TODO:
# - set $PATH to bin
# - source the autocomplete, later put it in /etc/bash_completion.d
# - get the installer to make a directory to archive then do the install logic

echo ""
echo "Regref Installer"
echo ""

USERNAME="$USER"
echo $USERNAME
# Create a destination folder
DESTINATION="$HOME/bin"

sudo /bin/bash -c "mkdir -p ${DESTINATION}"
mkdir regref
cd ..
mv regref/!(install.sh) regref/regref
cd regref
tar czfv regref_build.tar.gz regref
cat regref_build.tar.gz >> install.sh

# Find __ARCHIVE__ marker, read archive contents and decompress it
ARCHIVE=$(awk '/^__ARCHIVE__/ {print NR + 1; exit 0; }' "${0}")
sudo /bin/bash -c "tail -n+${ARCHIVE} \"${0}\" | tar xpzv -C ${DESTINATION}"

# Install logic
sudo /bin/bash -c "chmod +x ${DESTINATION}/regref/bin/regref.sh"
sudo /bin/bash -c "mv ${DESTINATION}/regref/regref-completion.sh /etc/bash_completion.d; source /etc/bash_completion.d/regref-completion.sh"
# clean-up
cd regref
rm -rf regref_build.tar.gz
mv * ..
cd ..
rm -rf regref
rm -rf regref_build.tar.gz

# Set up $PATH variable
source $HOME/.profile
PATH_MATCH=$(echo $PATH | grep -E '(\/usr\/opt\/[:]?)')

if [[ ! $PATH_MATCH =~ \/usr\/opt\/[:]? ]];
then
        echo 'export PATH="${PATH:+${PATH}:}/$HOME/bin"' >> $HOME/.profile
        source $HOME/profile

fi


echo ""
echo "Installation complete."
echo ""

# Exit with success
exit 0

__ARCHIVE__
�      �]�S۸�s�
5�CRȋ<��.�C)m��B�n�]��Vb�v-;�-ݿ���Ė��M轻:3�D�:�9::���6ؤ_��$Հ�[-�Y�o��?Cڪ7��F��j���j�u���Z�* �9�Fh�Gt��{��/XPnY��)پ����b-�8�4*L[[K�_�����[�=H߫5�-T[��?\�����j��?��+�����1Q�\� �u�X�"G�Y��&5bCEcӾg��Mӈ��<a�N����rr�g��ٲ]��b)�-�*�k(�d����?J��h�"�?�]�S�o˿����N��vJ�\TJ�>��8-��|�sy�W����Cb8��ʂ�P�H���3q�*���h�g�r�s��"sd-;:?��<�8��Aq����ʟP~��.K�R	���T~���	9��DE�2A�_�s��r?ZS%m���hSud���_o���r�������n6S�_o��Z��k{�f�ߨ�����s�F�9��Сӣ�P�е�L��$���k3��ј:Z����ڹ������]�8��#�tj�t�f�yp�C�sl>�f��sw��
�͸�]�]���\���{@�L[E=�5TlOW��g�I��%~@��!w-�C�ܽ6�=x�x��ݑ�m�8�FG:f���F�Ԃ_ ����H	�&�Ц��}Ǆ}�I��ZXɤts��J�x�N½��ddl��#��f������>-S���!ܑi8����m9�����"
��lt���hT���)֘)�"s�:�(���|�'��v}��aۦx��ӎk+�9"�k����"\_�ƴ���w2í]����z?��ph��V�|�`�p�7'�0�
����[v@��8w�k/�zW
M;���x���Dp��5��'�҉у�sW"w;b�
'B[ϊ5�H�ճv��[�hTO���S�X��o��$��n�N���x��!�V��=��p�o���ׂ��ĨR����X6a��23�g5�ӹ)�Lb9�'�b4ɔb�(��C���SM@�R��� �m��� b�_;I�t�24�
����r���3���y�{��R������Y��w��N	W.�#Θ��$�5�a��r�C�C�Zy_ ��!�����ǀu�'�*s{��Z��AvT{f��q�F��;�C��χ�6�#Qӵ7���@l��fl�;�#�'IQP1�fQ����-�n�����j��3H)κN���ާM@
�6f��g �(�$�|�9�ίH��ͭGid��p$e!0º���5Kc?��>�&8ˈ��ֿ���C�x�c��:��*
Q7�}Lu�i�Cv t�NM�k��-X�w>��j��7�7���|��vP#+{wt�����.�������Bʦ#X�ϳ���<(tC��(׸��]��}HN=I8DtF�1C�B���p�0����9�:��`S0��A�=q���]oJ&�� [��
��#d7ײ��Y��@�D�O��^,��S����;�O�ú��8��@	8���<�ǟ#��Fp�b
\v��,�Pp<枥v.�ӱq���&@�V'�~O�M�q�W����v"8�pl=�ج�,���--�w�M8D}�ş� �;��!r�ws�"E��n�s�+��M��>���l$>���`�q�5ձ�����ث��2��Y(;�V`30�ii���5Jś��[�K��K���RC�
��d�@�����d����	8*�$��P�E8*����2T 'Cd�@���P*�	N�
�P�����P�w2T N�
<��;*�<2T`������h��?8���7����Z��?��_����9hͧ�k>�\�Ϛ��׼5��m�5�����h���S��__���|���9H�i�����R`����c���ڍF���V�����6Os��\wK��h61��y�����
/��_stE����ͫ��˛&>�Z�
�W��@�C����^ySz2~��+�J#�;
B��C����/�/�F~�ע�ٽ����'u���E��5���������`&7Ww�Q�ɲb�}��1�2T��(�͟������sv.y�������SʜntH�Wk���V_p�L�ئK���+Gtk�r/;�5>]1���Y�/�>;���B��4B��8����5ށ#ܟE���F�_ �������������J�\^����ϯ�;���W��W#3����zO�|\"��82������5�J�:t�׿�:�-�^�� ����{cD�8Q�������b�{�˕��)q�	�� -�q���J|/Q%=w0�^����%��'���5P���d��k�v@0Cy�C;']�Q��j��"� �����C����D)�Rh�R��S"���q۳
�I:�g7�J��%�G��������`�
(OF��
��+v��OڠM��HC����^�m91FX�j0�;���ŜO#:��at� �J`�����c��O����m����������{�j0yVW�x�t�v�0z��s��+:�_~&�����Ѱ��>�a�*L�El}�4"�jڱD~�$	�Lu&"���#w=��������P�D�������ݔ�?��2Z�]��x�+���B]��>�܃\���t���5|��7���h�;���E-�2�m�ݨ����2����CHUx��5��oÞ�3�V@�� xg�
<̽���厠_�j�����:s��:5𐂭ҧ��sg��������w�@0�U'>�k�|�2�y� �{�	���^�a�&�\��=(�wp��K	ޏ�q�G�h$�i�$I�$I�$I�$I�$I�j��~4/ x  