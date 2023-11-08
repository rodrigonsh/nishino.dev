<script setup>

import {Head, Link, useForm} from '@inertiajs/vue3';

import GuestLayout from '@/Layouts/GuestLayout.vue';
import CTA from '@/Components/CTA.vue';

defineProps({
    canLogin: Boolean,
    canRegister: Boolean,
    laravelVersion: String,
    phpVersion: String,
    status: String,
    post: Object
});


</script>


<template>    
<GuestLayout canLogin="canRegister" canRegister="canRegister" title="POST">

    <Head title="Sobre" />
    
    <div id="post">
        
        <img id="hero" :src="'/storage/'+post.image" />

        <v-container class="h-100" >
        
            <div class='pa-4'>
                <h1>{{ post.title }}</h1>
                <div v-html="post.body"></div>
            </div>
            

        </v-container>

    </div>

    <CTA></CTA>
        
</GuestLayout>
</template>
