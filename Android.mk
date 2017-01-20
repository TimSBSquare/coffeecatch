LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := libcoffeecatch
LOCAL_SRC_FILES := coffeecatch.c coffeejni.c
# -Werror disabled
LOCAL_CFLAGS := -fPIC -O3 -g3 -pthread \
    		-W -Wall -Wextra -Wno-unused-function \
		-D_REENTRANT -D_GNU_SOURCE \
		-funwind-tables -Wl,--no-merge-exidx-entries
LOCAL_LDFLAGS := -shared -fPIC -O3 -Wl,-O1 -Wl,--no-undefined \
    		-rdynamic -shared
LOCAL_LDLIBS := -ldl
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := test
LOCAL_SHARED_LIBRARIES := libcoffeecatch
LOCAL_SRC_FILES := sample.c
LOCAL_CFLAGS := -fPIC -O3 -g3 \
    		-W -Wall -Wextra -Werror -Wno-unused-function \
		-D_REENTRANT \
		-funwind-tables -Wl,--no-merge-exidx-entries
LOCAL_LDFLAGS := -fPIC -O3 -Wl,-O1
include $(BUILD_EXECUTABLE)
