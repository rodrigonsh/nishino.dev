<script setup>

import {Head, Link, useForm} from '@inertiajs/vue3';

import GuestLayout from '@/Layouts/GuestLayout.vue';
import axios from 'axios';

defineProps({
    canLogin: Boolean,
    canRegister: Boolean,
    laravelVersion: String,
    phpVersion: String,
    status: String,
    posts: Array
});


</script>


<template>    
<GuestLayout canLogin="canRegister" canRegister="canRegister" title="BLOG">
    
    <Head title="Sobre" />

    <v-container class="h-100" id="blog">
       
        <v-row no-gutters>

            <v-col
                v-for="post in posts"
                :key="post.id"
                cols="12"
                sm="4"
            >

                <Link :href="route('post', {slug: post.slug})">
                <v-card class="ma-2" elevation="e3">
                    
                    <img :src="'/storage/'+post.image" />

                    <div class='pa-4'>
                        <h2>{{ post.title }}</h2>
                        {{ post.excerpt }}
                    </div>

                </v-card>
                </Link>

            </v-col>

            </v-row>

    </v-container>
        
        
</GuestLayout>
</template>
