<script>
import Vue from 'vue';

export default {
    created() {
        // #ifdef APP-PLUS
        plus.navigator.closeSplashscreen();
        // #endif
    },
    onLaunch: function() {
        uni.getSystemInfo({
            success: function(e) {
                // #ifndef MP
                Vue.prototype.StatusBar = e.statusBarHeight;
                if (e.platform == 'android') {
                    Vue.prototype.CustomBar = e.statusBarHeight + 50;
                } else {
                    Vue.prototype.CustomBar = e.statusBarHeight + 45;
                }
                // #endif

                // #ifdef MP-WEIXIN
                Vue.prototype.StatusBar = e.statusBarHeight;
                let custom = wx.getMenuButtonBoundingClientRect();
                Vue.prototype.Custom = custom;
                Vue.prototype.CustomBar = custom.bottom + custom.top - e.statusBarHeight;
                // #endif

                // #ifdef MP-ALIPAY
                Vue.prototype.StatusBar = e.statusBarHeight;
                Vue.prototype.CustomBar = e.statusBarHeight + e.titleBarHeight;
                // #endif
            }
        });
    },
    onShow: function() {
    },
    onHide: function() {
    }
};
</script>

<style lang="scss">
/*每个页面公共css */
@import '@/uni_modules/uni-scss/index.scss';
/* #ifndef APP-NVUE */
@import '@/static/customicons.css';
// 设置整个项目的背景色
page {
    background-color: #f5f5f5;
}

/* #endif */
.example-info {
    font-size: 14px;
    color: #333;
    padding: 10px;
}
</style>
