from mypackage import my_math # import module from package
print(my_math.custom_add(10, 20))

import mypackage # entire package
print(mypackage.my_math.custom_add(10, 20))

from mypackage import * # all modules from the package
print(my_math.custom_add(10, 20))

