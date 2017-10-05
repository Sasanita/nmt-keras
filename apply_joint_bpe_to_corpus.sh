
if [ $# -lt 6 ]; then
    echo "Usage: `basename $0` corpus_path training test dev l1 l2 <n_ops>"
    echo "Applies BPE to a corpus. The files must be named training.l?, dev.l?, test.l?"
    echo "example:`basename $0` europarl en fr 32000"
    exit 1
fi

bpe_dir=~/NMT/subword-nmt

corpus_path=$1
l1=$2
l2=$3
training_=$4
dev_=$5
test_=$6
#set_group=$7
#inf_num=$8

if [[ $# -lt 7 ]]
then
    n_ops=32000

else
    n_ops=$8
fi

# Prepare output dir
dest_dir=${corpus_path}/joint_bpe
mkdir -p ${dest_dir}
mkdir -p ${dest_dir}/dev-test


echo "Learning joint BPE..."
cat  ${corpus_path}/${training_}.${l1}  ${corpus_path}/${training_}.${l2} > /tmp/tr
${bpe_dir}/learn_bpe.py -s ${n_ops} < /tmp/tr  > ${dest_dir}/training_codes.joint

# Apply BPE codes (only for training and dev/test sources)

for lang in $l1 $l2 ; do
    echo "Applying BPE to training sets..."
    ${bpe_dir}/apply_bpe.py -c  ${dest_dir}/training_codes.joint < ${corpus_path}/${training_}.${lang} > ${dest_dir}/${training_}.${lang}
done

echo "Applying BPE to dev and test sets..."
	${bpe_dir}/apply_bpe.py -c  ${dest_dir}/training_codes.joint < ${corpus_path}/dev-test/${test_}.${l1} > ${dest_dir}/dev-test/${test_}.${l1}
	${bpe_dir}/apply_bpe.py -c  ${dest_dir}/training_codes.joint < ${corpus_path}/dev-test/${dev_}.${l1}> ${dest_dir}/dev-test/${dev_}.${l1}
	cat ${corpus_path}/dev-test/${dev_}.${l2} > ${dest_dir}/dev-test/${dev_}.${l2}
	cat ${corpus_path}/dev-test/${test_}.${l2} > ${dest_dir}/dev-test/${test_}.${l2}

rm /tmp/tr
echo "Done"
