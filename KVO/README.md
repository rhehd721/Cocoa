# KVO

- 이 예제는KVO 예제 입니다.

![run screen](./image.png)

## 다른 코드 예제

- 선언
```objc
    [self.child1 addObserver:self forKeyPath:@"name"
                     options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld)
                     context:nil];
    
    [self.child1 addObserver:self forKeyPath:@"age"
                     options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld)
                     context:nil];
    
    [self.child1 addObserver:self forKeyPath:@"address"
                     options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld)
                     context:nil];

```

- 해제
```objc
[self.child1 removeObserver:self forKeyPath:@"name"];
[self.child1 removeObserver:self forKeyPath:@"age"];
[self.child1 removeObserver:self forKeyPath:@"address"];
```

- 값의 변화
```objc
[self.child1 setValue:@"DH" forKey:@"name"];
[self.child1 setValue:[NSNumber numberWithInteger:1] forKey:@"age"];
[self.child1 setValue:[NSNumber numberWithInteger:2] forKey:@"age"];
[self.child1 setValue:@"지구" forKey:@"address"];
```

- 값의 감시
```objc
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"name"]) {
        NSLog(@"name = %@", change);
    }
    
    if ([keyPath isEqualToString:@"age"]) {
        NSLog(@"age = %@", change);
    }
    
    if ([keyPath isEqualToString:@"address"]) {
        NSLog(@"address = %@", change);
    }
}

```

- 결과
```objc
2017-12-31 00:14:41.163402+0900 KVOExample[2901:441373] name = {
    kind = 1;
    new = DH;
    old = "";
}
2017-12-31 00:14:41.163670+0900 KVOExample[2901:441373] age = {
    kind = 1;
    new = 1;
    old = 0;
}
2017-12-31 00:14:41.163843+0900 KVOExample[2901:441373] age = {
    kind = 1;
    new = 2;
    old = 1;
}
```

- 감시 못하게
```objc
+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key {
    if ([key isEqualToString:@"address"]) {
        return NO;
    } else {
        return [super automaticallyNotifiesObserversForKey:key];
    }
}
```

- 응용
  - iOS의 화면을 회전시키는 Method는 사용을 할수가 없습니다. private하기 때문입니다. 그런데 이것을 위의 KVC를 사용하면 가능합니다.

```objc
NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationLandscapeLeft];
[[UIDevice currentDevice] setValue:value forKey:@"orientation"];
```
