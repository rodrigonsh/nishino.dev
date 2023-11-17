<script setup>

import { Head, Link } from '@inertiajs/vue3';
import InputRules from "@/Shared/rules"
import GuestLayout from '@/Layouts/GuestLayout.vue';
import Swal from 'sweetalert2'
import { computed, ref } from 'vue'

import { useAppStore } from './../store.js'
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

    store.setUserMessage(message.value)
    setTimeout(function () {
        messages.value.scrollTop = messages.value.scrollHeight
    })

    let fd = new FormData(document.querySelector('#send'))
    fd.append('message', message.value)
    fd.append('lang', store.lang)


    let xhr = new XMLHttpRequest()
    xhr.onload = function () {

        store.setAssistantMessage(xhr.responseText)
        store.setChatStatus(false)
        
        setTimeout(function () {
            messages.value.scrollTop = messages.value.scrollHeight
        })
    }

    xhr.open('POST', route('message'));
    xhr.send(fd)

    message.value = ""

}

</script>

<template>
    <GuestLayout canLogin="canRegister" canRegister="canRegister" title="Harvey" customClass="chat">

        <Head title="Fale conosco" />

        <v-container id="chat">

            <div :class='{ chatMessages:true, loading: store.chatLoading}' ref="messages">

                <div class='chatMessage'>

                    <v-avatar class='mr-2 mt-3' image="/img/harvey-profile.png"></v-avatar>

                    <p class="harvey">

                        <strong>Harvey Wood: <br /></strong>
                        <span lang="pt">Você está conversando com Harvey, uma AI desenhada para entender suas necessidades e negociar um bom acordo. Começe me dizendo seu nome e seu endereço de email</span>
                        <span lang="en">You are talking to Harvey, an AI designed to understand your needs and negotiate a good deal. Start by telling me your name and your email address</span>
                        <span lang="es">Estás hablando con Harvey, una IA diseñada para comprender tus necesidades y negociar un buen trato. Empieza diciéndome tu nombre y dirección de correo electrónico.</span>

                    </p>

                </div>

                <div class='chatMessage' v-for="m in store.chatMessages" :key="m.key">

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

            <form @submit.prevent="enviar()" id="send">

                <input type="hidden" name="_token" :value="laravelToken">

                <v-text-field variant="underlined" prepend-inner-icon="mdi-message" v-model="message"
                    :label="getLabel('message')" :rules="[InputRules.required]" required />

                <v-btn type="submit" icon="mdi-send" size="large" variant="plain"></v-btn>

            </form>

        </v-container>


    </GuestLayout>
</template>
