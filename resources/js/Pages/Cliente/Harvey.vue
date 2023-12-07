<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { Head } from '@inertiajs/vue3';

import InputRules from "@/Shared/rules"
import Swal from 'sweetalert2'
import { computed, ref } from 'vue'

import { useAppStore } from '@/store.js'
const store = useAppStore()


const props = defineProps({
    canLogin: Boolean,
    canRegister: Boolean,
    laravelToken: String,
});

const getLabel = function (field) {
    let labels =
    {
        'message': {
            'pt': 'Mensagem',
            'en': 'Message',
            'es': 'Mensaje',
        }
    }

    return labels[field][store.lang]
}

const messages = ref()
const message = ref('')

const enviar = () => {

    store.setChatStatus(true)

    store.setUserMessage("harvey-client", message.value)
    setTimeout(function () {
        messages.value.scrollTop = messages.value.scrollHeight
    })

    let fd = new FormData(document.querySelector('.chat-send'))
    fd.append('message', message.value)
    fd.append('lang', store.lang)


    let xhr = new XMLHttpRequest()
    xhr.onload = function () {

        store.setAssistantMessage("harvey-client", xhr.responseText)
        store.setChatStatus(false)
        
        setTimeout(function () {
            messages.value.scrollTop = messages.value.scrollHeight
        })
    }

    xhr.open('POST', route('message-client'));
    xhr.send(fd)

    message.value = ""

}

</script>

<template>
    <Head title="Harvey" />

    <AuthenticatedLayout title="Harvey">
        
        <v-container class='w-100 pa-7 bg-dialog'>
            <h1>Harvey</h1>
        </v-container>

        <v-container class="chat">

            <div :class='{ chatMessages:true, loading: store.chatLoading}' ref="messages">

                <div class='chatMessage' v-for="m in store.clientMessages" :key="m.key">

                    <v-avatar v-if="m.user == 'Harvey Wood'" class='mr-2 mt-3' image="/img/harvey-profile.png"></v-avatar>
                    <v-avatar v-else class='mr-2 mt-3' image="/img/user-profile.jpg"></v-avatar>

                    <p class="harvey" v-if="m.user == 'Harvey Wood'">

                        <strong>Harvey Wood: <br /></strong>
                        {{ m.message }}

                    </p>

                    <p class="user" v-else>
                        <strong>{{ m.user }}: <br /></strong>
                        {{ m.message }}
                    </p>

                </div>

            </div>

            <form @submit.prevent="enviar()" class="chat-send">

                <input type="hidden" name="_token" :value="laravelToken">

                <v-text-field variant="underlined" prepend-inner-icon="mdi-message" v-model="message"
                    :label="getLabel('message')" :rules="[InputRules.required]" required />

                <v-btn type="submit" icon="mdi-send" size="large" variant="plain"></v-btn>

            </form>

            </v-container>

    </AuthenticatedLayout>
</template>
