<script>

export default {

    data: () => ({
      drawer: (window.innerWidth > 600),
    }),

}

</script>

<script setup>

    import { Link } from '@inertiajs/vue3';

    import { useAppStore } from './../store.js'

    import { computed } from 'vue'

    const store = useAppStore()

    const getLang = computed( function()
    {
        return store.lang
    })

    const changeLang = function()
    {
        store.toggleLang()
    }

    defineProps({
        canLogin: Boolean,
        canRegister: Boolean,
        title: String,
    });

    const getTrans = function(msg)
    {

        if ( undefined == store ) return;

        let trans = {
            'dashboard':
            {
                'pt': "Dashboard",
                'en': "Dashboard",
                'es': "Dashboard",
            },
            'leads':
            {
                'pt': "Leads",
                'en': "Leads",
                'es': "Leads",
            },
            'clientes':
            {
                'pt': "Clientes",
                'en': "Clientes",
                'es': "Clientess",
            },
            'financeiro':
            {
                'pt': "Financeiro",
                'en': "Billing",
                'es': "Facturas",
            },
            'documentos':
            {
                'pt': "Documentos",
                'en': "Documentos",
                'es': "Documentos"
            },
        }

        console.log(msg)

        return trans[msg][store.lang]
    }
    

</script>


<template>

    <v-app :lang="store.lang">

    <v-navigation-drawer color="surf" v-model="drawer">
        <v-container class="pa-5 d-flex flex-column ">

            <Link id="menuLogo" href="/" class="d-block w-75 my-6 mx-auto">
                <img src="/img/logo-nsh.svg" class="app-logo d-block w-100 mb-3" />

                <span lang="pt" class="text-center">Área Administrativa</span>
                <span lang="en" class="text-center">Back Office </span>
                <span lang="es" class="text-center">Bacl Office</span>

            </Link>

            

                <v-list density="compact" nav>

                    <Link href="/admin">

                    <v-list-item 
                        prepend-icon="mdi-chart-box"
                        :title="getTrans('dashboard')"
                        :ripple="true"
                        link
                    ></v-list-item>

                    </Link>

                    <v-divider />
                    
                    <Link href="/admin/leads">

                        <v-list-item 
                            prepend-icon="mdi-email"
                            :title="getTrans('leads')"
                            :ripple="true"
                            link
                        ></v-list-item>

                    </Link>

                    <v-divider />
                    
                    <Link href="/admin/clientes">

                        <v-list-item 
                            prepend-icon="mdi-account-multiple"
                            :title="getTrans('clientes')"
                            :ripple="true"
                            link
                        ></v-list-item>

                    </Link>

                    <v-divider />

                    <Link href="/admin/financeiro">
                    <v-list-item 
                        prepend-icon="mdi-cash-multiple"
                        :title="getTrans('financeiro')"
                        :ripple="true"
                    ></v-list-item>
                    </Link>

                    <v-divider />

                    <Link href="/admin/chat">
                    <v-list-item 
                        prepend-icon="mdi-message"
                        title="Donna"
                        :ripple="true"
                    ></v-list-item>
                    </Link>

                    <v-divider />

                    <Link href="/admin/docs">
                    <v-list-item 
                        prepend-icon="mdi-text-box"
                        :title="getTrans('documentos')"
                        :ripple="true"
                    ></v-list-item>
                    </Link>

                    <v-divider />

                    <v-list-item 
                        prepend-icon="mdi-translate"
                        :title="getLang"
                        :ripple="true"
                        @click="changeLang"
                    ></v-list-item>

                </v-list>

        </v-container>
    </v-navigation-drawer>

    <v-app-bar class="bg-nishino">

        <v-app-bar-nav-icon @click="drawer = !drawer"></v-app-bar-nav-icon>

        <v-app-bar-title>
            {{ title }}
        </v-app-bar-title>
       

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


    <v-main class="bg-forest">
        <slot />

        <v-container class="w-100 ma-0 bg-footer">
            <strong>NISHINO LTDA</strong><br />
            48.129.023/0001-27
        </v-container>

    </v-main>

    </v-app>


</template>

