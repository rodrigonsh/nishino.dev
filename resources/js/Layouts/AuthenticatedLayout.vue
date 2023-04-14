<script>

export default {

    data: () => ({
      drawer: true,
    }),

    methods:
    {
        teste: function()
        {
            console.log("humm")
        }
    }

}

</script>

<script setup>

    import { Link } from '@inertiajs/vue3';

    defineProps({
        title: String,
    });

</script>


<template>

    <v-app>

    <v-navigation-drawer color="blue-grey-lighten-1" v-model="drawer">
        <v-container class="pa-5 d-flex flex-column justify-center align-center">
            <Link href="/" class="d-block w-75 my-6">
                DASDSA
            </Link>
            testeeee
        </v-container>
    </v-navigation-drawer>

    <v-app-bar>

        <v-app-bar-nav-icon @click="drawer = !drawer"></v-app-bar-nav-icon>

        {{ title }}

        <v-spacer></v-spacer>

        <v-btn
            prepend-icon="mdi-account"
            append-icon="mdi-menu-down"
            @click="teste"
        >

        {{ $page.props.auth.user.name }}
        
    
        <v-menu offset-y activator="parent">
            
            <v-list>

                <v-list-item>
                <v-list-item-title>
                    <Link :href="route('profile.edit')"> Profile </Link>
                </v-list-item-title>
                </v-list-item>

                <v-list-item>
                <v-list-item-title>
                    <Link :href="route('logout')" method="post" as="button"> Log Out </Link>
                </v-list-item-title>
                </v-list-item>
            
            </v-list>

        </v-menu>

    </v-btn>

        
                                    

    </v-app-bar>


    <v-main>

        <v-container>
            <slot />

        </v-container>

    </v-main>

    </v-app>


</template>
