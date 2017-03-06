# OCJDRefreshControl   
###集成-->   
- 1--> 将文件夹  OCJDRefreshControl  拖到项目中   
- 2--> 头文件中引用 #import "JPRefreshControl.h"    
- 3--> 实例化一个刷新控件     
  

```
self.refreshControl = [[JPRefreshControl alloc] initWithFrame:CGRectZero];    
[self.refreshControl addTarget:self action:@selector(loadData) forControlEvents:UIControlEventValueChanged];   
[self.refreshTableView addSubview:self.refreshControl];
```

- 4--> 拿到数据后 结束刷新   

```
 [self.refreshControl endRefreshing];   
```

#####[附:Swift版本](https://github.com/baiyidjp/SwiftJDRefreshControl)


###可以根据需求自定义图片文字 逻辑已经写好    

![image](http://ww2.sinaimg.cn/mw690/80888a28gw1fb4bdzsh5gg20a90ic7nb.gif) 
