<template>
    <view>
        <uni-list>
            <uni-list-chat avatar="/static/user.jpg" :title="member.name" :note="member.phoneNumber">
                <view><uni-tag :text="'' + member.age" type="primary" inverted="true" /></view>
            </uni-list-chat>
        </uni-list>
        <uni-list>
            <uni-list-item
                :showExtraIcon="true"
                :extraIcon="{ color: '', size: '22', type: 'settings' }"
                title="设置个人信息"
                :showArrow="true"
                to="changeMyInfo/changeMyInfo"
                :clickable="true"
            ></uni-list-item>
            <uni-list-item
                :showExtraIcon="true"
                :extraIcon="{ color: '', size: '22', type: 'undo-filled' }"
                title="退出登录"
                :showArrow="true"
                @click="logout"
                :clickable="true"
            ></uni-list-item>
        </uni-list>
    </view>
</template>

<script>
export default {
    data() {
        return {
            member: {}
        };
    },
    onLoad() {
        this.member = uni.getStorageSync('member');
    },
    methods: {
        logout() {
            this.$axios.get('/member/logout').then(res => {
                if (res.data.flag) {
                    uni.clearStorage();
                    uni.clearStorageSync();
                    uni.reLaunch({
                        url: '/pages/login/login'
                    });
                }
            });
        }
    }
};
</script>

<style></style>
