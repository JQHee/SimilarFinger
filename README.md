# SimilarFinger
仿Finger课程详情页嵌套实现。
其实这个页面实现并不难，可以使用ScrollView和tableVIew以及collectionView多层嵌套实现，只是在课程详情介绍部分多了个左侧的悬浮菜单，增加了实现逻辑的复杂度。我在这里底层只用tableView嵌套collectionView来实现，而左侧的悬浮菜单，只需要合理计算位置便可实现跟随滑动和悬浮切换菜单。demo只是简陋实现滑动和切换效果，不做cell样式和大小的细节处理。
