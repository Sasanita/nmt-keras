# NMT-Keras/examples

This folder contains some examples and tutorials showing how the library works.
 
## On the tutorials
 
 There are 3 Jupyter notebooks. All of them have been executed launching 
 
 ```bash
ipython notebook
  ```
at the root `nmt-keras` folder.

These tutorials basically are a split version of the execution pipeline of the library. If you run `python main`, you'll execute almost the same as tutorials 1 and 2. For readability, much of the variables representing model hyperparameters are hardcoded in the tutorials. 
On a real execution, these values are taken from the `config.py` file.
   

The translation task is *EuTrans* ([Amengual et al.](http://link.springer.com/article/10.1023/A:1011116115948)), a toy-task mainly used for debugging purposes.
Since it is an easy task, the model should converge in few (~6-8) epochs, yielding a BLEU-4 score close to 1 in the case of the Es->En language direction.



## On the documentation

In the `documentation` folder you'll find a couple of pdf files:

* [neural_machine_translation.pdf](https://github.com/lvapeab/nmt-keras/blob/master/examples/documentation/neural_machine_translation.pdf) contains a (theoretical) overview of an attentional NMT system.
* [staged_keras_wrapper.pdf](https://github.com/lvapeab/nmt-keras/blob/master/examples/documentation/staged_keras_wrapper.pdf) contains the autogenerated documentation for the staged_keras_wrapper package (at 30/Nov/2016).


## TODO list

- [ ] Add a tutorial for building a NMT model with Keras.

- [ ] Document (with sphinx) the NMT-Keras library

- [ ] Add a document explaining the typical output of a training. 