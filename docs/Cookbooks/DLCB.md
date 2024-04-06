
# Part I: Fundation

>[!note]- Look for help
>In Python:
>```Python
># i.e. check torch.nn's all functions
>print(dir(torch.nn))
>
># i.e. get help on a function, class or something
>help(torch.nn.BatchNorm2d)
>```
>PyTorch Forum
>PyTorch Tutorials
>PyTorch Documentation

## torch.tensor & other functions

>[!warning]- When creating Tensor using ndarray
>The two will share storage:
>```Python
>arr = np.array([0.,1.,2.])
>A = torch.from_numpy(arr)
>arr[:] = 0
>A # tensor([0., 0., 0.], dtype=torch.float64)
>
>## not for a scalar, PyTorch will copy a new one
>arr_scalar = np.array(3.)
>B = torch.from_numpy(arr_scalar)
>arr_scaler = 0
>B # tensor(3., dtype=torch.float64)
>
># tolist
>X.tolist()
>```

>[!note]- Basic Operations for Tensors
>```Python
>'''create tensors'''
>
>X = torch.tensor([[1,1],[1,2]])
>X = torch.zeros([10,10])
>X = torch.ones([1,2,3])
>X = torch.arange(3)
>X = torch.linspace(-2,2,10)
>X_repeat = X.repeat(3, 2) # repeat 3 times along dim=0, 2 times along dim=1
>
>X.data # acquire the tensor without gradient
>X_clone = X.clone # this will create the same tensor as X, but don't share the same storage. 
># ATTENTION: this will be recoded by autograd (when set requires_grad=True), you can use X_clone = X.detach().clone() to disable this
>
>'''tensor's shape and number of dimensions'''
>
>arrayX = np.arange(100).reshape(2,5,10)
>arrayX.shape # return (2,5,10)
>
>X = torch.tensor(array)
>X.shape # return torch.Size([2,5,10]) with respects to 
># dim 0, dim 1, dim 2. here the dim is same to the axis in NumPy
>X.reshape(2,-1)
>
>X.ndim, X.dim(), X.ndimension() # difference?
>
>'''tensor's dtype'''
>
>X = torch.tensor([1,2])
>X.dtype # return torch.int64
>X = torch.Tensor([1,2])
>X.dtype # return torch.float32
>X = torch.tensor([1,2],dtype=torch.float32)
>X = X.type(torch.int64)
>
>'''common arithmetic functions'''
>
>Z = X + Y
>Z = X - Y
>Y = X.pow(2)
>X_sum = X.sum()
>X_sum_axis0 = X.sum(axis=0) # decrease dimension along axis=0
>X_mean = X.mean()
>X.std()
>X.max(), X.min()
>X.numel() # count num of elements
>
>'''matrix operation'''
>
>A = torch.ones(2,4)
>B = torch.ones(4,1)
>torch.matmul(A,B) # like matrix multiplication, you can try A = torch.ones(4), which will be different with torch.ones(1,4)
>A@B == torch.matmul(A, B)
>X_trans = X.transpose(0,1)
>
>X = torch.ones((3,2,4))
>Y = torch.ones((3,4,6))
>torch.bmm(X, Y).reshape # return torch.Size([3,2,6]) batch matrix multiplication
>
>'''squeeze and unsqueeze'''
>
>X = torch.zeros([1,2,5])
>X.squeeze(0) # Remove length-1 dimension only, otherwise returning the same tensor
>X.unsqueeze(0) # Expand a dimension
>
>'''concatenate multiple tensors'''
>X = torch.ones([1,1,3])
>Y = torch.ones([1,4,3])
>Z = torch.ones([1,5,3])
>cat_XYZ = torch.cat([X,Y,Z], dim=1)
>cat_XYZ.shape # return torch.Size([1,10,3])
>
>'''stack multiple tensors'''
>
>A = torch.ones(3,4)
>B = torch.ones(3,4)
>torch.stack([A,B], dim=0)
>
># difference between torch.cat and torch.stack
>
>torch.stack([A,B], dim=0).shape # return torch.Size([2,3,4]), concatenate along a new dimension
>torch.cat([A,B], dim=0).shape # return torch.Size([6,4]), concatenate in the given dimension
>
>'''Anti-Stack/Cat'''
>torch.unbind(torch.tensor[[1.,2.], [3.,4.], dim=1]
>X = torch.arange(4.) + 1
>X.view(2,-1)
>```

>[!question]- Difference between `reshape` and `view`?
>[Sources](https://stackoverflow.com/questions/42479902/what-does-view-do-in-pytorch)
>`reshape`: return a new tensor
>`view`: share storage

>[!note]- Device
>[Use cuda](https://stackoverflow.com/questions/50954479/using-cuda-with-pytorch)
>```Python
>torch.cuda.is_available() # check if your gpu works
>
>device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')
>
>X = torch.ones([1,2,3])
>X = X.to('cpu')
>X = X.to('cuda') # set X computed by GPU
>X.device
>
># here is an example
>
>device = torch.device('cpu')
>if torch.cuda.is_availabe():
>	device = torch.device('cuda')
>```

>[!note]- Autograd
>```Python
>torch.autograd.backward(tensor, grad_tensors=None, 
>			retain_graph=None, create_graph=False)
>```
>```Python
>X = torch.tensor([[1,1],[1,2]],requires_grad=True)
>f_X = X.pow(2).mean()
>f_X.backward()
>X.grad
>X
>X.grad.zero_() # clear the grad
>
>'''quicker ways to require grad when you have many tensors to do so'''
>X = torch.ones(10)
>Y = torch.randn(1,4)
>Z = torch.arange(2.)
>for t in [X, Y, Z]:
>	t.requires_grad_(True)
>	print(t)
>```
>^RoughAutograd

>[!note]- More About Autograd
>Sources: [PyTorch Tutorials](https://pytorch.org/tutorials/beginner/blitz/autograd_tutorial.html), [stackoverflow](https://stackoverflow.com/questions/57248777/backward-function-in-pytorch), [Documentation](https://pytorch.org/docs/stable/generated/torch.Tensor.backward.html), [PyTorch Autograd](https://pytorch.org/docs/stable/notes/autograd.html)
>```Python
>Tensor.backward(gradient=None, retain_graph=None, create_graph=False, inpus=None)
>```
>- `create_graph`: if `True`, the graph of the **derivative** will be constructed, allowing to compute higher oreder derivative products.
>```Python
>X = torch.tensor(1., requires_grad=True)
>Y = X.pow
>Y.backward()
>d1 = X.grad
>
>```
>By defaults (with no arguments): `backward()` is called on a scaler
>```Python
>X = torch.tensor([2.,3.,4.], requires_grad=True)
>Y = X.sum().backward()
>X.grad
>
>A = torch.arange(6.).reshape(2,-1)
>A.requires_grad=True
>for i in range(A.shape[0]):
>	for j in range(A.shape[1]):
>		out = A[i,j].pow(2)
>		out.backward()
>print(A.grad)
>```
>Note that PyTorch **does not** support non-scaler function derivatives. Any non-scaler tensors $\mathbf{M}$ are regarded as intermediates (or local nodes in computational graphs), and PyTorch always expected that there exists some loss $L$ (scaler), and it can calculate $\frac{\partial{L}}{\partial{\mathbf{M}}}$ ==according to the chain rules==.
>
>i.e. the following `Y` is a vector, when you call backward on it, PyTorch expected you give it the "upstream" gradients it need to calculate $\frac{\partial{L}}{\partial{\mathbf{Y}}}$ (it images there exists $L$). Below I gives `torch.ones_like(X)` as the "upstream" gradient. It can look like $\mathbf{Y}$ is calculated by some function as (actually not): L=y1+y2+y3+C,C is some constants,∂L∂Y=[1,1,1] then the gradients of `X` is calculated as: ∂L∂X=∂L∂Y∂YX=[1,1,1]∘[4,6,8]=[4,6,8]
>```Python
>'''You can 'add' grad to a tensor'''
>X = torch.tensor([2.,3.,4.], requires_grad=True)
>Y = x.pow(2)
>Y # a vector
>Y.backward(torch.ones_like(Y))
>```
>There still some confusing things according to the Chain rule, see the below examples
>```Python
>X = torch.tensor([1.,2.], requires_grad=True)
>A = torch.tensor([[1.,2.], [3.,4.]], requires_grad=True)
>Y = torch.matmul(X,A)
>Y.backward(torch.tensor([1.,2.]))
>X.grad, A.grad
>```
>**???** need more study
>^Autograd

>[!question]- Difference between `detach` and `with torch.no_grad`
>Sources: [stackoverflow](https://stackoverflow.com/questions/56816241/difference-between-detach-and-with-torch-nograd-in-pytorch)
>- `tensor.detach()` **creates** a tensor that <u>does not requires grad</u>, which shares the same storage with the original tensor. And it detaches the tensor from the computational graph.
>```Python
>net = nn.Linear(4,1)
>X = torch.ones(4, requires_grad=True)
>X # tensor([1., 1., 1., 1.], requires_grad=True)
>X_de = X.detach()
>X_de # tensor([1., 1., 1., 1.])
>
>Y = net(X)
>Y # tensor([-0.1955], grad_fn=\<AddBackward0>)
>Y_de = Y.detach()
>Y_de # tensor([-0.1955])
>```

>[!question]- What is PyTorch Graph?
>Run the below code you will get
>```Python
>X = torch.ones(1, requires_grad)
>X # tensor([1.], requires_grad=True)
>Y = 2 * X
>Y # tensor([2.], grad_fn=\<MulBackward0>)
>Y.backward()
>X.grad # tensor([2.])
>Y.backward() 
># ...... Calls into the C++ engine to run the backward pass 
># RuntimeError: Trying to backward through the graph a second time (or directly access saved tensors after they have already been freed)
># Saved intermediate values of the graph are freed when you call .backward() or autograd.grad()
># Specify retain_graph = True if you need to backward through the graph a second or if you need to access saved tensors after calling backward()
>X.grad.zero()
>
>Y = 2 * X + 1
>Y # 
>Z = Y.pow(2) / 2
>Z # 
>```
>^PyTorchGraph

>[!note]- masked_fill\_
>`Tensor.masked_fill\_(mask, value)`
>- `mask` (BoolTensor)
>```Python
>mask = torch.rand(10) >= 0.6
>X = torch.arange(20.).reshape(2,-1)
>X.masked_fill_(mask, 19.)
>```

>[!note]- PyTorch BroadCasting
>```Python
>X = torch.arange(10.).unsqueeze(1) # let X.shape be (10,1)
>Y = torch.tensor([2.,2.])
>X / Y
>```

### Random Variables

>[!note]- torch.rand
>[Documentation](https://pytorch.org/docs/stable/generated/torch.rand.html)
>Get a uniform distribution in $[r_1,r_2]$：
>```Python
>r1 = 1
>r2 = 5
>shape = (3,3)
>(r_2-r_1) * torch.rand(shape) + r_2
>```
>Make masks:
>```Python
>mask = torch.rand(10) > 0.6
>```

>[!note]- torch.randn
>Standard normal distribution.
>```Python
>torch.randn((3,3), dtype=torch.float32, requires_grad=False)
>```
>- `out`: the output tensor
>- `layout`: the storage layout of the tensor
>- `device`: `torch.device('cuda' if cuda.is_available() else 'cpu')`

>[!note]- Tensors' in-place random sampling
>[Documentation](https://pytorch.org/docs/stable/torch.html#inplace-random-sampling)
>```Python
>X = torch.tensor([1.,4.])
>
>'''Uniform distribution'''
>
>X.uniform_(from=1, to=5, generator=None)
>
>'''Bernoulli Distribution'''
>
>'''Cauchy distribution'''
>
>'''Exponential distribution'''
>
>'''Geometric distribution'''
>
>'''Log-normal distribution'''
>
>'''Normal distribution'''
>
>'''Discrete uniform distribution'''
>
>'''Continuous uniform distribution'''
>```

>[!note]- torch.Generator
>[Documentation](https://pytorch.org/docs/stable/generated/torch.Generator.html#torch.Generator)
>```Python
>torch.Generator(device='cpu')
>```
>Creates and returns a **generator** object, used as a <u>keyword argument</u> in many **in-place** random sampling.
>- `get_state()`: Returns the Generator <u>state</u> as a `torch.ByteTensor`, which contains all the necessary <u>bits</u> to <u>restore a Generator</u>.
>- `set_state()`
>- `manual_seed(seed)`: the seed can be any 32-bit integer, returning a `torch.Generator` object
>```Python
>X = torch.tensor([1.,2.])
>g = torch.Generator().manual_seed(19)
>state_0 = g.get_state() # get generator's current state
>X.normal_(0, 2, generator=g) # this will change X's value in place
>state_1 = g.get_state()
>X.normal_(0, 2, generator=g) # this will return a different tensor
># note that when you pass the keyword argument generator to the in-palce sampling (i.e. normal_)
># you just tell PyTorch which generator to use, it will not reset the states for you
>g.set_state(state_0)
>X.normal_(0, 2, generator=g)
>g.set_state(state_1)
>X.normal_(0, 2, generator=g)
>```
>^Generator

### Unsorted

>[!note]- torch.repeat_interleave
>
>```Python
>torch.repeat_interleave(input, repeats, dim=None, *, ouput_size=None)
>```
>
>Repeat elements of a tensor.
>- repeats(Tensor or int): number of repetitions for each elemts
>- dim(int, opt): the dimension along which to repeate values. By default, will return a flat output array with repeated values.

>[!question]- `reapeat_interleave` and `repeat` in making attention masks (the former is True)
>[Sources](https://stackoverflow.com/questions/68205894/how-to-prepare-data-for-tpytorchs-3d-attn-mask-argument-in-multiheadattention/75447422#comment120670107_68205894)

>[!note]- torch.nan_to_num
>```Python
>torch.nan_to_num(input, nan=0.0)
>```

### Common Functions for Tensors

>[!note]- Elementary Functions
>Sources: [Wikipedia](https://en.wikipedia.org/wiki/Elementary_function#:~:text=In%20mathematics%2C%20an%20elementary%20function,inverse%20functions%20(e.g.%2C%20arcsin%2C)
>```Python
>X = torch.tensor([3.])
>torch.sin(0.01 * X)
>torch.sqrt(X)
>```

>[!note]- Activation functions
>```Python
>X = torch.tensor([2.,1.,1.])
>torch.sigmoid(X)
>```

>[!note]- torch.argmax and torch.max
>```Python
>torch.argmax(input, dim, keepdim=False)
>```
>
>```Python
>torch.max(input, dim, keepdim=False, out=None)
>```

### More

>[!note]- Triangular matrices
>[Documentation](https://pytorch.org/docs/stable/generated/torch.triu.html)
>```Python
>a = torch.rand((4,4))
>torch.triu(a)
>torch.tril(a)
>```

## torch.linalg

>[!note]- Norm
>[Documentation](https://pytorch.org/docs/stable/generated/torch.linalg.norm.html#torch.linalg.norm)
>```Python
>torch.linalg.vector_norm(x, ord=2, dim=None, keepdim=False, dtype=None, out=None)
>```
>- for a complex value `x`, return `x.abs()`
>- `dim=None`, flatten and compute norm. `dim` is an `int` or `tuple`, compute along the dimensions.
>- `ord`: `inf` for max(abx(x)), `-inf` for min(abs(x)), `0` for sum(x!=0). Other int or float: $$\left(\sum\limits_{\lvert x_i\rvert}^{\text{ord}}\right)^{1/\text{ord}}$$

## torch.utils.data

### data.Dataset

>[!note]- data.Dataset
>[Documentation](https://pytorch.org/docs/stable/data.html#torch.utils.data.Dataset)
>Base class for all PyTorch map-styple datasets. All subclasses should overwrite `__getitem__()`. Because different datasets have different map.
>
>Supporting fetching a data sample for a given key (for hashable object)

>[!example]- Custom Your Dataset
>Overwrite `__getitem__`, `__len__`
>```python
>class MyDataset(Dataset):
>	def __init__(self, file):
>		self.data = ...
>		
>	def __getitem__(self, index):
>		return self.data[index]
>		
>	def __len__(self):
>		return len(self.data)		
>```
>
>Here is an advanced example
>Sources: [PyTorch Documentation](https://pytorch.org/tutorials/beginner/data_loading_tutorial.html)
>```Python
>import os
>import pandas as pd
>from skimage import io
>import torch
>import torch.utils.data as data
>from torchvison import transforms
>
>class FaceLandmarksDataset(Dataset):
>	def __init__(self, csv_file, root_dir, transform=None):
>		self.landmarks_frame = pd.read_csv(file)
>		self.root_dir = root_dir
>		self.transform = transform
>	
>	def __len__(self):
>		return len(self.landmarks_frame)
>	
>	def __getitem__(self, idx):
>		if torch.is_tensor(idx):
>		
>		img_name = os.path.join(self.root_dir,
>					self.landmarks_frame.iloc[idx,0])
>		image = io.imread(image_name)
>		landmarks = self.landmark_frame.iloc[idx, 1:]
>		landmarks = np.array([landmarks],dtype=float).reshape(-1,2)
>		sample = {'image':image, 'landmarks':landmarks}
>		
>		if self.tranfrom:
>			sample = self.transform(sample)
>		
>		return sample
>```
>

>[!example]- Map-style Dataset: Get Image and its target
>```Python
>import torch
>from PIL import Image
>
>```

>[!warning]- About Dataset Class

>[!note]- data.TensorDataset
>Wrapping tensors as a dataset, you can then get each sample by indexing tensors along the first dimension.
>```Python
>dataset = data.TensorDataset(*tensors) # the tensors need to have the same size of the first dimension
>```
>^TensorDataset

>[!example]- Create an iterable-style dataset with arrays
>```Python
>import torch
>from torch.utils import data
>def load_array(data_arrays, batch_size, is_train=True):
>	dataset = data.TensorDataset(*data_arrays)
>	return data.DataLoader(dataset, batch_size, shuffle=is_train)
>```

### data.DataLoader

>[!note]- What is DataLoader
>```Python
>DataLoader(dataset, batch_size=1, shuffle=False, sampler=None, 
>		batch_sample=None, num_workers=0, collate_fn=None,
>		pin_memory=False, drop_last=False, timeout=0,
>		worker_init_fn=None, *, prefetch_factor=2, persistent_workers=False)
>```
>
>At the heart of PyTorch data loading utility is the `torch.utils.data.DataLoader` class, which represents a Python iterable over a dataset (combines a dataset and a sampler)
>
>- dataset(Dataset)
>- batch_size(int,opt,`1`):
>- shuffle(bool,opt,`False`): set to `True` to reshuffle the data every epoch
>- sampler(Sampler or Iterable,opt,`None`): define the method to get samples from the dataset. ❗If specified, `shuffle` must **not** be specified

>[!example]- Load Fashion-MNIST Dataset
>import torch
>import torchvision
>from torch.utils import data
>from torchvision import transforms
>mnist_train = torchvision.datasets
>^FashionMNIST

### data.Sampler

>[!note]- data.Sampler(data_source=None)
>Base class for all Samples
>
>Every Sampler subclass has to provide an `__iter__()` method, which is a way to ierate over indices or <u>list of indices</u> (for batches) of dataset elements, and a `__len__()` method that returns the length of the returned iterators
>^sampler

>[!note]- data.random_split
>[Documentation](https://pytorch.org/docs/stable/data.html#torch.utils.data.random_split)
>```Python
>torch.utils.data.random_split(dataset, lengths,
>			generator=<torch._C.Generator object>)
>```
>Split a dataset into non-overlapping new datasets. Note that `random_split` will return `Dataset` object, so you can then use `DataLoader` to process `Dataset`
>
>- `generator`: [Check here](#^Generator)
>- `lengths`: a sequence (lengths or fractions of splits to be produced)
>
>```Python
>g = torch.Generator().manual_seed(20)
>train_dataset, validation_dataset = random_split(range(10), [0.3,0.7], generator=g)
>train_iter = torch.utils.data.DataLoader(train_dataset)
>```
>^RandomSplit

>[!example]- Split a dataset
>Sources: [stackoverflow](https://stackoverflow.com/questions/50544730/how-do-i-split-a-custom-dataset-into-training-and-test-datasets)
>```Python
>import torch.utils.data as data
>train_size = int(0.8 * len(dataset))
>test_size = len(dataset) - train_size
>train_dataset, test_dataset = data.random_split(dataset, [train_size, test_size])
>```

## torch.nn

>[!note]- nn.Module
>[Documentation](https://pytorch.org/docs/stable/generated/torch.nn.Module.html)
>base class for all neural network modules
>- `apply(fn)`: Applies function **recursively** to <u>every submodule</u> as well as self.
>```Python
># initialize the parameters
>def init_weights(m):
>	if type(m) == nn.Linear:
>		m.weight.normal_(0,0.01)
>net = nn.Sequentail(nn.Linear(4,4), nn.ReLU(), nn.Linear(2,2))
>net.apply(init_weights) # this will initialize nn.Linear(4,4) and nn.Linear(2,2) parameters
>```
>- `zero_grad(set_to_none=False)`: Reset gradients of all model parameters.
>- `eval()`: Set the module in evaluation mode, which is equivalent to `self.train(False)
>
>>[!note]- Cases using `eval()`
>>```Python
>>'''Batch normalization'''
>>
>>'''Dropout'''
>>
>>'''Forbid gradient calculation'''
>>```
>
>- `children()`: Returns an iterator over **immediate** children modules. Here's an example:
>```Python
>class ParentNetwork(nn.Module):
>	def __init__(self):
>		super(ParentNetwork, self).__init__()
>		self.layer1 = nn.Linear(4,2)
>		self.bastard = torch.tensor([[2.,3.],[3.,4.]]) # this will not be registered as the module's child
>		self.layer2 = nn.ReLU()
>		self.layer3 = nn.Linear(2,1)
>	
>	def forward(self, input):
>		return self.layer3(self.layer2(self.bastard(self.layer1(input))))
>model = ParentNetwork()
>for layer in model.children():
>	print(layer)
>
>for layer in model.children():
>	if hasattr(layer, 'reset_parameters'):
>		print(layer)
>```
>About `module.train()` and `module.eval()`
>
>>[!question]- Why do we need `module.train()`/`module.eval()`?
>>Sources: [stackoverflow](https://stackoverflow.com/questions/51433378/what-does-model-train-do-in-pytorch)
>
>You can define names for submodules:
>```Python
>class NN(nn.Module):
>	def __init__(self):
>		super().__init__()
>	
>	def diy_add_modules(self, submodules, names):
>		for name, submodule in zip(names, submodules):
>			self._modules[name] = submodule
>	
>	def forward(self, X, who_gonna_do):
>		for name in who_gonna_do:
>			X = self._modules[name](X)
>		return(X)
>
>My_nn = NN()
>My_nn.diy_add_modules([nn.ReLU(), nn.Linear(1,1), nn.Linear(1,2), nn.Linear(2,1)], ['A','B','C','D'])
>X = torch.tensor([-1.])
>My_nn(X, ['A'])
>My_nn(X, ['C','A','D'])
>
> # PyTorch also provides you with add_modules() method
>My_nn.add_module(nn.ReLU(), 'A_')
>```
>- `add_module(name, module)`
>- `modules()`: Returns an iterator over all modules.
>
>>[!question]- `nn.ModuleDict`, `OrderedDict` and `dict`
>>Sources: [PyTorch Forum](https://discuss.pytorch.org/t/nn-moduledict-vs-ordereddict-vs-dict/145418)
>>Note that submodules are <u>registered</u> using `_modules`.
>
>>[!question]- Difference between `.module()` and `.children()` & Remove NN layers
>>[Forum](https://discuss.pytorch.org/t/module-children-vs-module-modules/4551)
>>```Python
>>net = nn.Sequential(nn.Linear(2,2), nn.Sequential(nn.Sigmoid(), nn.ReLU()))
>>'''.modules() will recursively go into all modules in the network'''
>>list(net.modules())
>>'''[Sequential(
>>(0): Linear(in_features=2, out_features=2, bias=True)
>>(1): Sequential(
>>	(0): Sigmoid()
>>	(1): ReLU()
>>	)
>>), Linear(in_features=2, out_features=2, bias=True), Sequential(
>>	(0): Sigmoid()
>>	(1): ReLU()
>>), Sigmoid(), ReLU()]'''
>>
>>'''.children() will not go into the submodule'''
>>list(nn.Sequential(nn.Linear(3,4), nn.ReLU()).children())
>>'''[Linear(in_features=2, out_features=2, bias=True), Sequential(
>>	(0): Sigmoid()
>>	(1): ReLU()
>>)]'''
>>```
>- `parameters(recurse=True)`: Returns an iterator over module parameters
>
>>[!question]- how to reset a module's parameters?
>>```Python
>>for layer in model.children():
>>	if hasattr(layer, 'reset_parameters'):
>>		layer.reset_parameters()
>>```
>
>- `state_dict()` Returns an OrderedDict containing references to the whole state of a module.
>- `register_buffer(name, tensor, persistent)`: Adds a buffer to the module
>
>>[!question]- Difference between `register_buffer` and `register_parameter`?
>>[Forum](https://discuss.pytorch.org/t/what-is-the-difference-between-register-buffer-and-register-parameter-of-nn-module/32723)
>
>- `cpu()`: move all model parameters and buffer to CPU
>- `cuda(device=None)`: move all model parameters and buffer to GPU
>^Module

>[!Question]- How to save and load my Module/Tensor?
>```Python
>'''save & load tensor'''
>T = torch.tensor('......')
>torch.save(x, 'path/name.pt')
>T_load = torch.load('path/name.pt')
>
>'''save & load tensor list'''
>X, Y = torch.tensor([2.,3.]), torch.tensor(3.)
>torch.save([X, Y], 'path\\anyname')
>X, Y = torch.load('path\\anyname')
>
>'''save & load dict'''
>mydict = {'module':module, 'param':param}
>torch.save(mydict, 'path/mydict.pt')
>mydict_ = torch.load('')
>
>'''save a moudle and its parameters'''
>torch.save(net.state_dict(), 'module.params')
>clone = MLP()
>clone.load_state_dict(torch.load('module.params'))
>```

>[!note]- nn.Sequential
>[Documentation](https://pytorch.org/docs/stable/generated/torch.nn.Sequential.html)
>add modules in order
>You can see `nn.Sequential` as an ordered container.
>```Python
>import torch
>import torch.nn as nn
>from collections import OrderedDict
>
>net = nn.Sequential(
>	nn.Conv2d(1,20,5),
>	nn.ReLU(),
>	nn.Conv2d(20,64,5),
>	nn.ReLU()
>	)
>
># functionally the same as above
>named_net = nn.Sequential(OrderedDict([
>				('conv1', nn.Conv2d(1,20,5)),
>				('relu1', nn.ReLU()),
>				('conv2', nn.Conv2d(20,64,5)),
>				('relu2', nn.ReLU())
>]))
>
># you can also append layers to a list, and then create a net using nn.Sequential
>layers = []
>layers.append(nn.Linear(4,4))
>layers.append(nn.ReLU())
>layers.append(nn.Linear(4,2))
>net = nn.Sequential(*layers)
>
># acquire specific layer
>net[0].weight.data
>named_net.conv1.weight.data # call by the name of the layer
>
>```

>[!example]- Build a simple Net: Toy MLP
>```Python
>import torch.nn as nn
>
>class ToyMLP(nn.Module)
>	super(ToyMLP, self).__init__()
>	self.net = nn.Sequential(
>		nn.Linear(8, 4),
>		nn.ReLU(),
>		nn.Linear(4, 4)
>	)
>	
>	def forward(self, X):
>		return self.net(X)
>```
>
>Another example
>
>```Python
>class ToyMLP(nn.Module)
>	def __init__(self, n_feature, n_hidden, n_output)
>		super(ToyMLP, self).__init__()
>		self.hidden = torch.nn.Linear(n_feature, n_hidden)
>		self.relu = torch.nn.ReLU()
>		self.out = torch.nn.Linear(n_hidden, n_output)
>		self.softmax = torch.nn.Softmax(dim=0)
>	
>	def forward(self, X):
>		X = self.hidden(X)
>		X = self.relu(X)
>		X = self.out(X)
>		X = self.softmax(X)
>		return X
>```

>[!example]- Custom Your Network: A more flexible example
>Sources: [D2l](https://zh.d2l.ai/chapter_convolutional-neural-networks/conv-layer.html)

>[!note]- nn.ModuleList
>```Python
>torch.nn.ModuleList(module=None)
>```
>- `append(module)`: appends a given module to the end of the list
>- `extend(module)`: receive iterable of modules to append

>[!note]- nn.Linear
>Linear Layer
>$$Linear\_layer(X) = W\cdot X + b$$
>
>`torch.nn.Linear(in_features, out_features)`
>Note that the input tensor's last dimension must be the same as the linear layer's first dimension
>i.e. **Input Tensor**: $*\times2$ -> **Linear Layer**: $2\times 3$ -> **Output Tensor**: $*\times3$
>```Python
>import torch
>import torch.nn as nn
>
>lin_layer = nn.Linear(10,20) # you can simply think this as a function, with random parameters
>
># you can call the parameters and initialize them as you want
>lin_layer.weight.data
>lin_layer.bias.data
>
>lin_layer.weight.data.normal_(0,0.01)
>lin_layer.bias.data.fill_(0)
>
>lin_layer.weight.data = torch.ones(lin_layer.weight.shape)
>```

>[!note]- nn.LazyLinear
>```Python
>net = nn.Sequential(nn.LazyLinear(4), nn.ReLU(), nn.LazyLinear(1))
>net[0].weight # \<UninitializedParameter>
>net[0] # LazyLinear(in_features=0, out_features=4, bias=True)
>X = torch.rand(2,2)
>net(X) # the framework will initialize sequentially
>```

>[!note]- nn.Sigmoid, torch.nn.ReLU:
>Common Activation Functions
>```Python
>import torch.nn as nn
>
>acti_sigmoid = nn.Sigmoid()
>acti_Relu = nn.ReLU()
>```

>[!note]- nn.Softmax
>```Python
>torch.nn.Softmax(dim=None)
>```
>- input & output: any number of additional dimensions, the shapes of input and output are same.
>- `dim`(`int`): the dimension along which Softmax calculates.
>^Softmax

>[!question]- How to copy my module?
>Python has `copy.deepcopy()` to handle this
>Sources: [geeksforgeeks](https://www.geeksforgeeks.org/copy-python-deep-copy-shallow-copy/)
>```Python
>import copy
>LN = torch.nn.Linear(4,1)
>LN_clone = copy.deepcopy(LN)
>LN_clone == LN, LN_clone.weight == LN.weight, LN_clone.bias == LN.bias
># the first will return False while others True
>```

>[!question]- Reproducibility?
>Sources: [Documentation](https://pytorch.org/docs/stable/notes/randomness.html)

### CNN

>[!note]- nn.Conv2d
>[Documentation](https://pytorch.org/docs/stable/generated/torch.nn.Conv2d.html)
>```Python
>torch.nn.Conv2d(in_channels, out_channels,
>		kernel_size, stride=1, padding=0, dilation=1
>		group=1, bias=True, padding_mode='zeros',
>		device=None, dtype=None)
>```
>- `padding`: not that if you use `padding=2`, then all sides of the tensors will be added 2 rows(columns)
>^conv2d

>[!note]- nn.MaxPool, nn.AvgPool
>```Python
># PyTorch's MaxPool and AvgPool's output channels' number is the same as input numbers
>
>X = torch.arange(16).reshape(1, 1, 4, -1)
>X = torch.cat((X, X+1),1)
>
>avg_pool2d = nn.MaxPool2d(3, padding=1, stride=2)
>avg_pool2d(X)
>```
>^maxavgpool

>[!note]- nn.Flatten
>```Python
>torch.nn.Flatten(strat_dim=1, end_dim=-1)
>```

>[!note]- nn.Unflatten
>```Python
>torch.nn.Unflatten(dim, unflattened_size)
>```
>- `dim`: the dimension of the input tensor to be unflattened

>[!note]- nn.ConvTranspose2d
>[Documentation](https://pytorch.org/docs/stable/generated/torch.nn.ConvTranspose2d.html)
>```Python
>torch.nn.ConvTranspose2d(in_channels, out_channels, kernel_size, 
>			stride=1, padding=0, output_padding=0,
>			groups=1, bias=True, 
>			dialation=1, padding_mode='zeros',
>			device=None, dtype=None)
>```
>

>[!note]- nn.ModuleDict
>Sources: [PyTotch discussion](https://discuss.pytorch.org/t/get-key-of-nn-sequential-made-with-ordereddict/170249)

### RNN

>[!note]- nn.RNN
>Sources: [Documentation], [stackoverflow](https://stackoverflow.com/questions/68220175/what-is-the-output-of-pytorch-rnn)
>```Python
>torch.nn.RNN(self, input_size, hidden_size
>		num_layers=1, nonlinearity='tanh',
>		bias=True, batch_first=False, dropout=0,
>		biadirctional=False, device=Nonw,
>		dtype=None
>)
>```
>
>- Note that all weights and biases are initialized from uniformed distribution: $u(-\sqrt{k},\sqrt{k}),k=\frac{1}{\text{hidden\_size}}$
>- `batch_first`: If `True`, then the input and output tensors are provided as (batch, seq, feature) instead of (seq, batch, feature). <u>This does not apply to hidden or cell states</u>.
>- **Return**: 1) `output`: $(N,L,D*H_{out})$ $D=2$ if `bidirectional=True` otherwise `1`; 2) `h_n`: tensor of shape $(D\times \text{num\_layers}, H_{out})$ for unbatched input or $(D\times\text{num\_layers}, N, H_{out})$ containing the latest hidden state.
>```Python
>rnn_layer = nn.RNN(4, 3, , bias=False, num_layers=2)
>rnn_layer.all_weights
>rnn_layer.weight_ih_l0 # ih for input-hidden, l0 for layer 0
>rnn_layer.bias_ih_l0
>
>rnn_layer.weight_hh_l0 # hh for hidden-hidden
>rnn_layer.bias_hh_l0
>
>rnn_layer.weight_ih_l1 # acquire the second layer
>
>input = torch.ones(size=(1, 3, ))
>
>```
>^RNN

### Attention

>[!note]- nn.Embedding
>[Documentation](https://pytorch.org/docs/stable/generated/torch.nn.Embedding.html)
>- I/O: 
>	- (\*) The input should be IntTensor or LongTensor of <u>arbitrary shape</u>.
>	- (\*, H) H = `embedding_dim`
>- The weights initialized from $\mathcal{N}(0,1)$
>
>^Embedding

>[!note]- nn.MultiheadAttention
>[Documentation](https://pytorch.org/docs/stable/generated/torch.nn.MultiheadAttention.html)
>```Python
>torch.nn.MultiheadAttention(embed_dim, num_heads, dropout=0.0,
>			bias=True, add_bias_kv=False, add_zero_attn=False,
>			kdim=None, vdim=None, batch_first=False,
>			device=None, dtype=None
>			)
>```
>- `embed-dim`: Total dimension of the *model*
>- `num_heads`: Each head will have dimension `embed_dim // numheads`
>- `bias`: Default:`True`. If specified, adds bias to input / output projection layers.
>- `batch_first`: Defalut: `False` ($\text{seq}, \text{batch}, \text{feature}$). If `True`, the input and output tensors are provided as $(\text{batch}, \text{seq}, \text{feature})$
>
>```Python
>forward(query, key, value, key_padding_mask=None,
>	need_weights=True, attn_mask=None,
>	average_attn_weights=True, is_causal=False)
>```
>- `query`:
>	- $(\text{L}, \text{E}_q)$ for unbatched input.
>	- $(\text{L}, \text{N}, \text{E}_q)$ when `batch_first=False`
>	- $(\text{N}, \text{L}, \text{E}_q)$ when `batch_first=True`
>- `key`:
>
>Examples: Singlehead Dot Scaled Attention
>```Python
>input = torch.randn(2, 10, 4) # batch, time steps, embedding's dimension
>Singlehead = nn.MultiheadAttention(4, 1, bias=True, batch_first=True) # be careful with batch_first
>
>'''Single Attention Machinism'''
>Query = input@Singlehead.in_proj_weight[:4].t() + Singlehead.in_proj_bias[:4] 
># note that the bias was initialized as 0 vector
>Key = input@Singlehead.in_proj_weight[4:8].t()
>Value = input@Singlehead.in_proj_weight[8:].t()
>Sa = torch.bmm(Query, torch.transpose(Key, 1, 2)) / torch.sqrt(torch.tensor(4.))
>Sa_weight = torch.softmax(Sa, dim=-1)
>Weighted_value = Sa_weight@Value
>Output = Weighted_value@Singlehead.out_proj.weight.t()
>a, _ = Singlehead(input, input, input)
>a - Output
># the output is really close to zero, but not equal to it, I don't see the reason 
>```
>- `attn_mask`: if specified, a 2D/3D mask preventing attention to certain positions. **Note: (1,X,X) won't broadcast!**
>	- Binary and float tensors are both supported. Binary: True to indicates that the position is **not** allowed to attend, while float: the value will be added to <u>the attention weight</u>.
>- `key_padding_mask`: A mask of shape (N, S) indicating which elements withn key to ignore for the purpose of attention. (i.e. ignore padding)
>
>>[!note]- `attn_mask` and `key_padding_mask`
>>- key_padding_mask: 
>
>^MultiheadAttention

>[!note]- nn.Transformer
>[Documentation](https://pytorch.org/docs/stable/generated/torch.nn.Transformer.html)
>```Python
>torch.nn.Transformer(d_model=512, nhead=8, 
>		num_encoder_layers=6, num_decoder_layers=6, 
>		dim_feedforward=2048, activation=<function relu\>, dropout=0.1,
>		layer_norm_eps=1e-05, 
>		batch_first=False, norm_first=False,
>		bias=True, 
>		custom_encoder=None, custom_decoder=None,
>		device=None, dtype=None)
>```
>An example: [Word Language Model](https://github.com/pytorch/examples/tree/main/word_language_model)
>```Python
>forward(src, tgt, src_mask=None, tgt_mask=None, 
>	memory_mask=None, src_key_padding_mask=None,
>	tgt_key_padding_mask=None, memory_key_padding_mask=None,
>	src_is_causal=None, tgt_is_causal=None, 
>	memory_is_causal=False)
>```
>- `scr`: $(S,E)$ for unbatched input, $(N, S, E)$ if `batch_first=True`
>- `tgt`: $(T,E)$ ... $(N, T, E)$ ...
>- `src_mask`: $(S, S)$ or $(N\cdot num_{heads}, S, S)$
>- `tgt_mask`: $(T, T)$ or $(N\cdot num_{heads}, T, T)$
>^Transformer

### Loss Functions

>[!note]- nn.MSELoss
>```Python
>torch.nn.MSELoss(size_average=None, reduce=None, reduction='mean')
>```
>- `reduction`: $$l(x,y)=\left\{\begin{aligned}
&\frac{1}{N}\sum\limits_{n=1}^{N}l_n,\mbox{reduction='mean'}\\
&\sum\limits_{n=1}^{N}l_n,\mbox{reduction='sum'}
\end{aligned}\right.$$
>- `reduce`: Deprecated
>- `size_average`: Deprecated
>^MSELoss

>[!note]- nn.CrossEntropyLoss
>[Documentation](https://pytorch.org/docs/stable/generated/torch.nn.CrossEntropyLoss.html)
>```Python
>torch.nn.CrossEntropyLoss(weight=None, size_average=None, ignore_index=-100, reduce=None, reduction='mean', label_smoothing=0.0)
>```
>- `weight`: if provided, the input should be a 1D tensor assigning weight to each of the classes. (useful when you have an unbalanced training set)
>- Note that the **input** has to contain the <u>unnormalized logits</u> for each class. The shape of input has to be $(\text{minibatch}, C)$ or $(\text{minibatch}, C, d_1,d_2,\cdots,d_K)$ (for the K-dimensional case, i.e. computing cross entropy loss per-pixel for 2D images).
>- `reduction`: $$l(x,y)=\left\{\begin{aligned}
&\frac{1}{N}\sum\limits_{n=1}^{N}l_n,\mbox{reduction='mean'}\\
&\sum\limits_{n=1}^{N}l_n,\mbox{reduction='sum'}
\end{aligned}\right.$$ If `reduction` is set to `none`, then for a $N$ batch size input, the loss function will return $\{l_1,l_2,\cdots,l_N\}$ for each sample's loss.
>```Python
>criterion_mean = nn.CrossEntropyLoss()
>criterion_sum = nn.CrossEntropyLoss(reduction='sum')
>criterion_none = nn.CrossEntropyLoss(reduction='none')
>y_pred = torch.cat([torch.ones(17), torch.tensor([2.,3.,4.])]).reshape(2,-1)
>y_real = torch.ones([2,10])
>criterion_mean(y_pred, y_real)
>criterion_sum(y_pred, y_real)
>criterion_none(y_pred, y_real)
>```
>^CrossEntropyLoss

>[!warning]- `CorssEntropyLoss` do not calculate Cross Entropy Loss!

>[!note]- nn.BCELoss
>Measures the Binary Cross between the <u>input probabilities</u>： $$l_n=-w_n[\hat{y}_n\log y_n+(1-\hat{y}_n)\log(1-y_n)]$$

>[!note]- nn.BCEWithLogitsLoss
>[Documentation](https://pytorch.org/docs/stable/generated/torch.nn.BCEWithLogitsLoss.html)
>$$l_n=-w_n[y_n\log \sigma(x_n)+(1-y_n)\log(1-\sigma(x_n))]$$

>[!question]- BCELoss vs BCEWithlogitsLoss

>[!bug]- tensor(nan, grad_fn=\<MseLossBackward\>)
>State: Unknown Reason
>Possible solution: [Raddit](https://www.reddit.com/r/pytorch/comments/dd0o8w/tensornan_grad_fnmselossbackward_when_training_cnn/)
>to repeat the bug:

### Regularization

>[!note]- nn.Dropout
>[Documentation]()
>```Python
>torch.nn.Dropout(p=0.5, inplace=False)
>```
>- `inplace`: if set `True` this will do this operation in-place.
>^Dropout

>[!note]- nn.BatchNorm2d
>[Documentation](https://pytorch.org/docs/stable/generated/torch.nn.BatchNorm2d.html)
>```Python
>torch.nn.BatchNorm2d(num_features, eps=1e-05, momentum=0.1,
>			affine=True, track_running_stats=True,
>			device=None, dtype=None)
>```
>Applies Batch Normalization over **a 4D input** (and 2d refers to image(2d)) 
>```Python
>BN = nn.BatchNorm(1, affine=False, eps=0, momentum=0) # set channel's number to 1
>N1 = torch.ones(1,2,2)
>N2 = torch.ones(1,2,2) * 2
>B = torch.stack([N1, N2], dim=0)
>BN(B)
>```

>[!note]- nn.LayerNorm
>```Python
>torch.nn.LayerNorm(normalizaed_shape, eps=1e-0.5, elementwise_affine=True, 
>		bias=True, device=None, dtype=None)
>```
>- The mean and strandard-deviation are calculated over the last D dimension**s** (`normalizaed_shape`)
>	- The standard-deviation is calculated via the biased estimateor, equivalent to `torch.var(input, unbiased=False)`
>- `elementwise_affine`: set `True` to use $\gamma$ and $\beta$ to shift mean and standard-deviation.
>```Python
>X = torch.tensor([[[1.,2.],[2.,3.]]]) # X.shape: (1,2,2)
>LayerNorm = nn.LayerNorm((2,2), eps=0, elementwise_affine=False)
>
>LayerNorm(X)
>(X - X.mean()) / X.std(correction=0) 
>
>LayerNorm_ = nn.LayerNorm(2, eps=0)
>LayerNorm_(X)
>(X - X.mean(dim=-1)) / X.std(dim=-1, correction=0)
>```

### nn.functional

>[!question]- Difference between torch.nn.functional and torch.nn?
>Sources: [Stackexchange](https://stackoverflow.com/questions/63826328/torch-nn-functional-vs-torch-nn-pytorch)
>- `nn.functional.xxx`: You'll need to handle the parameters yourself (passing them to the optimizer or moving them to the GPU)
>- `nn.xxx`: easy to handle parameters with `net.parameters()`, `net.to(device)` etc.
>- You can see `nn.functional.xxx` as a more flexible function than `nn.xxx`. 

>[!note]- functional.softmax
>```Python
>torch.nn.functional.softmax(input, dim=None, _stacklevel=3, dtype=None)
>```

>[!note]- functional.one_hot
>```Python
>torch.nn.functional.one_hot(tensor, num_classes=-1)
>```
>- `num_classes`: set to `-1`, then the number of classes will be greater than the largest value in the input.
>```Python
>X = torch.tensor([0,3,5])
>F.one_hot(X)
>```

### nn.parameter

>[!question]- Why do we need nn.parameter.Parameter?
>Sources: [stackoverflow](https://stackoverflow.com/questions/50935345/understanding-torch-nn-parameter)
>- `Tensor`s are multi-dimensional matrices, while parameters are `Tensor` subclasses.When a parameter is associated with a module as its attribute, it will automatically be added to the parameter list of the module, and can be accessed using the `.parameters()` iterator **???**. 
>- This comes with a 
>```Python
>class simple_function(nn.Module):
>	def __init__(self):
>		super(simple_function, self).__init__()
>		self.weight0 = torch.tensor([1.,1.], requires_grad=True)
>		self.weight1 = torch.nn.Parameter(torch.tensor(5.,6.)) # by default, the parameter will be set `requires_grad=True`
>	
>	def forward(self, input):
>		return torch.matmul(self.weight1, input) + self.weight0.sum() * 1/2
>
>sf = simple_function()
>sf.parameters()
>for param in sf.parameters():
>	print(type(param.data), param)
>
># return <class 'torch.Tensor'> Parameter containing: tensor([5., 6.], requires_grad=True)
>
>X = torch.tensor([1.,1.])
>Y = sf(X)
>Y # tensor(12., grad_fn=\<AddBackward0>)
>
>Y.backward()
>sf.weight1.grad # tensor([1., 1.])
>sf.weight0.grad # tensor([0.5000, 0.5000])
>```

>[!note]- parameter.Parameter
>[Documentation](https://pytorch.org/docs/stable/generated/torch.nn.parameter.Parameter.html#torch.nn.parameter.Parameter)
>```Python
>torch.nn.parameter.Parameter(data=None, requires_grad=True)
>```
>A kind of tensor used as a module parameter. Parameters 

>[!note]- nn.init
>[Documentation](https://pytorch.org/docs/stable/nn.init.html)
>```Python
>'''Normal distribution'''
>nn.init.normal_(torch.empty(3,3), mean=3, std=1) # default 0.0, 1.0
>
>'''Constant'''
>LinearNet = nn.Linear(4,1)
>nn.init.constant_(nn.Linear.weight)
>
>'''Uniform distribution'''
>def init_uniform(net):
>	if isintance(net, nn.Linear):
>		nn.init.uniform_(net.weight)
>		net.bias.data.fill_(0)
>LinearNet.apply(init_uniform)
>```
>Xavier Uniform: generated tensor from $$u(-a,a), a=\text{gain}\times \sqrt{\frac{6}{\text{fan\_in}+\text{fan\_out}}}$$
>```Python
>w = torch.empty(2,2)
>nn.init.xavier_uniform_(w)
>```
>^init

## torch.optim

[Documentation](https://pytorch.org/docs/stable/optim.html)

>[!note]- optim.Optimizer:
>base class for all optimizers
>`torch.optim.Optimizer(params, defaults)`
>- `param` is an iterable of `torch.Tensor`s or `dict`s
>- a dict containing default values of optimization options
>
>- `Optimizer.zero_grad(set_to_none=True)`: Resets the gradient of all optimized `torch.Tensor`s
>	-set to none(bool): set the grads to `None` instead of to zero.

>[!question]- Why do we need to call zero_grad?
>Sources: [stackoverflow](https://stackoverflow.com/questions/48001598/why-do-we-need-to-call-zero-grad-in-pytorch)
>
>PyTroch accumulates the gradients on subsequent backward passes, which is useful when we want to sum the whole loss summed over multiple batches or training RNNs.
>^whyzerograd

>[!note]- optim.SGD
>Stomatic Gradient Descent
>```Python
>torch.optim.SGD(params, lr, momentum=0, dampening=0
>		weight_decay=0, nesterov=False, maximize=False, foreach=None, differentiable=False )
>```
>
>- `momentum`: momentum factor $\mu$
>	- `damplening`: dampening $\tau$ for momentum: 
>	- [Check here](DL.md#^Momentum)
>- `params`: iterable of parameters to optimize or dicts
>```Python
>net = nn.Sequential(nn.Linear(4,1), nn.Linear(1,2), nn.ReLU(), nn.Linear(2,1, bias=False))
>
>optimizer = torch.optim.SGD([{"params": net[0].weight, "weight_decay": 0.01}, {"params": net[0].bias}], lr=1.) # although all net.parameters are set to require gradient, you can choose which to update using optimizer
>rand_samples = torch.randn(5, 4)
>for i in range(len(rand_samples)):
>	print(f'Round{i}\n')
>	Y = net(rand_samples[i])
>	Y.backward()
>	optimizer.step()
>	for param in net.parameters():
>		print(param.data)
>	optimizer.zero_grad()
>```
>^SGD

>[!note]- optim.Adam
>```Python
>torch.optim.Adam(params, lr=0.001, betas=(0.9,0.999),
>		eps=1e-0.8, weight_decay=0, amsgrad=False,
>		maximize=False, capturable=False,
>		differentiable=False)
>```
>- `amsgrad`: AMSGrad vairant of this algorithm [Check](https://openreview.net/pdf?id=ryQu7f-RZ)
>^Adam

>[!example]- Change the learning rate based on number of epochs
>```Python
>import torch.optim.lr_scheduler.StepLR
>scheduler = StepLR(optimizer, step_size=5, gamma=0.1)
>
>for epoch in range(100):
>	train(...)
>	scheduler.step()
>```

## More

>[!note]- torch.multiprocessing
>```Python
>
>```

## torchvision

### transforms

>[!note]- transforms
>All transformations accept <u>PIL Image</u>, <u>Tensor Image</u> $(C,H,W)$ or <u>batch of Tensor Images</u> $(B,C,H,W)$ as input.
>

## torchtext

### torchtext.data.utils

>[!note]- utils.get_tokenizer
>```Python
>torchtext.data.utils.get_tokenizer(tokenizer, language='en')
>```
>- `tokenizer`: if `None`, if returns `split()` function (by space)
>	- `basic_english`: return `_basic_english_normalize()` function, first <u>normalizing</u> the string and then spliting it by space.

### torchtext.vocab

>[!note]- vocab.Vocab
>```Python
>from torchtext.vocab import vocab
>from collections import Counter, OrderedDict
>
>```

# Unsorted Notes

>[!note]- The Busy Person's Intro to LLMs
>[Sources](https://www.youtube.com/watch?v=zjkBMFhNj_g)
>>[!note]- Model Inference: What is a LLM?
>>Two Files (llama-2-70b by Meta AI): llama series - 2nd iteration of it - 70 billion parameters - All access to the paper, parameter, architecture.
>>
>>- Parameters: $140$GB
>>	- every one of those parameters is stored as 2 bytes (float 16 number)
>>- run.c $\sim500$ lines of C code
>>
>>You only need a device...(don't need network)
>
>>[!note]- Model Training: How do we get the parameters?
>>- Chunk of the internet ($\sim10$TB of text)
>>- $6000$ GPUs for $12$ days, $\sim$\$2M $\sim1e24$ FLOPs (floating-point operations per second)
>>	- like compression the chunks into a 'zip' file (but we don't have the chunks)
>>	- this are only **rookie numbers**, the state of the art models by $10$ or more...
>>
>>The LLM is simply predicting the next word in the sequence
>>
>>Next word prediction **forces** the neural network to learn a lot about the world
>>[[DLVisual]]
>
>>[!note]- LLM 'Dreams' / Hallucination
>>- Fake Links
>>- Fake Codes
>>- ...
>> It just puts in what every it 'thinks' reasonable
>
>>[!note]- How do they work?
>>We know every math operation. But <u>little is known in full detail</u>
>>- We can measure that this works, but we don't really know how the billions collaborate to do it. (Or equally, we do not actually how to rectify parameters precisely to make it work, we just 'train' it, like human teachers)
>>- The model's database is strange: reversal curse (one-dimensional?)
>
>>[!note]- Fine tuning: Training the Assistant
>>Training will be the same, but with different datasets. 
>>
>>First you write labeling instructions, and then hire people to write ideal Q&A responses, after that you have the dataset, and use it to train your dataset (fine-tuning), and deplot the model. When model running, you will get misbehaviours, then you can fine-tuning again (let people write the right Q&A responses and feed it into the dataset)
>>- $\sim100K$ conversations (people write: questions and ideal answers)
>>- Quality over quantity
>>After fine tuning you have the Assistant model.
>>
>>The model somehow still have access to the first-state (pretraining) knowledge.
>>
>>- Another way to fine-tuning: compare answers and feed back.
>
>>[!note]- LLM Scaling Laws
>>DO NOT SHOW SIGNS OF TOPPING OUT
>
>>[!note]- LLMs Use tools
>>- Browser
>>- Calculator
>>- Python Interpretor
>>- Vision: See and Generate images
>>- Audio: Hear and Speak
>
>>[!note]- Future
>>LLMs only have instinctive part, cannot think reasonably.
>>
>>Take 30minutes thinking
>>
>>Create <u>tree of thoughts</u>.
>
>>>[!note]- **Self-Imporvement**
>>>AlphaGo
>>
>>What does the step 2 look like in LLMs? Lack of reward criterion.
>
>>[!note]- Jailbreak
>
>>[!note]- Data poisoning and Backdoor attacks

# Hugging Face

>[!note]- pipeline
>```Python
>from transformers import pipeline
>
>classifier = pipeline('sentiment-analysis')
>classifier(['I miss you', 'I just miss your so much. I guess'])
>```
>- by default, the pipeline selects a particular trained model. The model is downloaded and cached.
>^pipeline

>[!example]- Zero-shot classification
>```Python
>classifier = pipeline('zero-shot-classification')
>classifier(
>	"this is my life",
>	candidate_labels=['education']
>)
>```
>- You don't need to fine=tune the model on your data to use it.

>[!example]- Text Generation
>```Python
>generator = pipeline('text-generation')
>generator('I miss you')
>
># specify a model
>generator = pipeline('text-generation', model='distilgpt2')
>generator(
>	'I miss you.',
>	max_length=30,
>	num_return_sequences=2,
>)
>```

>[!note]- Save models


<center><span style="font-family: Brush Script MT; font-size: 3em;">Stay Hungry, Stay Foolish</span></center>
