# Reduce the verbosity level

import ROOT
import saphyra
import os
import tensorflow as tf
os.environ['TF_CPP_MIN_LOG_LEVEL'] = '3' 

from tensorflow.python.client import device_lib
local_device_protos = device_lib.list_local_devices()
print([x.name for x in local_device_protos])

print("GPU available? {}".format(tf.test.is_gpu_available()))
print("GPU device name? {}".format(tf.test.gpu_device_name()))

a = tf.constant([1.0, 2.0, 3.0, 4.0, 5.0, 6.0], shape=[2, 3], name='a')
b = tf.constant([7.0, 8.0, 9.0, 10.0, 11.0, 12.0], shape=[3, 2], name='b')
c = tf.matmul(a, b)

print('assigning to /gpu:0')
with tf.device('/gpu:0'):
    d = tf.matmul(a, b)

sess = tf.Session(config=tf.ConfigProto(
      allow_soft_placement=True, log_device_placement=True))

print('printing c')
print (sess.run(c))

print('printing d')
print (sess.run(d))

