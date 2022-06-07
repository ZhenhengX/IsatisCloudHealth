<template>
    <uni-section>
        <view class="forms">
            <uni-forms :modelValue="memberNew">
                <uni-forms-item label="姓名" name="name"><uni-easyinput v-model="memberNew.name" /></uni-forms-item>
                <uni-forms-item label="性别"><uni-data-checkbox v-model="memberNew.sex" :localdata="sexs" /></uni-forms-item>
                <uni-forms-item label="身份证号" name="idCard"><uni-easyinput v-model="memberNew.idCard" /></uni-forms-item>
                <uni-forms-item label="手机号" name="phoneNumber"><uni-easyinput v-model="memberNew.phoneNumber" /></uni-forms-item>
                <uni-forms-item label="注册日期" name="regTime"><uni-easyinput v-model="memberNew.regTime" :disabled="true" /></uni-forms-item>
                <uni-forms-item label="电子邮箱" name="email"><uni-easyinput v-model="memberNew.email" /></uni-forms-item>
                <uni-forms-item label="生日" name="birthday"><uni-datetime-picker type="date" v-model="memberNew.birthday" /></uni-forms-item>
                <uni-forms-item label="健康管理师" name="healthmanager"><uni-easyinput v-model="memberNew.healthmanager" :disabled="true" /></uni-forms-item>
            </uni-forms>
            <button type="primary" @click="changeMemberInfo">保存</button>
        </view>
    </uni-section>
</template>

<script>
export default {
    data() {
        return {
            memberNew: {},
            // 单选数据源
            sexs: [
                {
                    text: '男',
                    value: '1'
                },
                {
                    text: '女',
                    value: '2'
                }
            ]
        };
    },
    onLoad() {
        this.memberNew = JSON.parse(JSON.stringify(uni.getStorageSync('member')));
    },
    methods: {
        changeMemberInfo() {
            uni.showLoading({
                title: '保存中'
            });
            let months = this.$moment().diff(new Date(this.memberNew.birthday), 'months');
            this.memberNew.age = Math.floor(months / 12);
            this.$axios
                .post('/member/editMember', this.memberNew)
                .then(res => {
                    uni.removeStorageSync('member');
                    this.memberNew = res.data.data;
                    uni.setStorageSync('member', this.memberNew);
                    uni.showToast({
                        title: res.data.message,
                        icon: 'success',
                        duration: 1200
                    });
                })
                .catch(err => {
                    uni.hideLoading();
                    uni.showToast({
                        title: err.data.message,
                        icon: 'error'
                    });
                });
        }
    }
};
</script>

<style>
.forms {
    padding: 15px;
    background-color: #fff;
}
</style>
