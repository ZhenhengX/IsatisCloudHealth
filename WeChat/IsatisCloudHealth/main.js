import Vue from 'vue'
import App from './App'
import axios from 'static/utils/https.js';
import moment from 'moment'

Vue.prototype.$moment = moment;

Vue.prototype.$axios = axios;

Vue.config.productionTip = false

App.mpType = 'app'

const app = new Vue({
    ...App
})
app.$mount()
