<?php



use App\Http\Controllers\ProfileController;
use App\Http\Controllers\ContatoController;
use App\Http\Controllers\ChatController;
use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;
use TCG\Voyager\Models\Post;
use App\Models\Project;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return Inertia::render('Welcome', [
        'canLogin' => false,
        'canRegister' => false,
        'projetos' => Project::all()
    ]);
});

Route::get('/about', function () {
    return Inertia::render('About', [
        'canLogin' => false,
        'canRegister' => false,
        
        
    ]);
})->name('about');


Route::get('/frontend', function () {
    return Inertia::render('Frontend', [
        'canLogin' => false,
        'canRegister' => false,
    ]);
})->name('frontend');

Route::get('/backend', function () {
    return Inertia::render('Backend', [
        'canLogin' => false,
        'canRegister' => false,
    ]);
})->name('backend');

Route::get('/consultoria', function () {
    return Inertia::render('Consultoria', [
        'canLogin' => false,
        'canRegister' => false,
    ]);
})->name('consultoria');


Route::get('/blog', function () {

    return Inertia::render('Blog', [
        'canLogin' => false,
        'canRegister' => false,
        
        
        'posts' => Post::all()
    ]);
})->name('blog');

Route::get('/blog/{slug}', function (string $slug) {

    $post = Post::where('slug', $slug)->firstOrFail();

    return Inertia::render('Post', [
        'canLogin' => false,
        'canRegister' => false,
        
        
        'post' => $post
    ]);
})->name('post');

Route::get('/projeto/{slug}', function (string $slug) {

    $projeto = Project::where('slug', $slug)->firstOrFail();

    return Inertia::render('Projeto', [
        'canLogin' => false,
        'canRegister' => false,
        'projeto' => $projeto
    ]);
    
})->name('projeto');

Route::get('/contato', function () {
    return Inertia::render('Contact', [
        'canLogin' => false,
        'canRegister' => false,
        
        
    ]);
});

Route::post('/contato', [ContatoController::class, 'enviar'])->name('enviar');

Route::get('/harvey', [ChatController::class, 'index'])->name('chat');
Route::post('/harvey', [ChatController::class, 'message'])->name('message');

Route::get('/harvey/debug', [ChatController::class, 'debug'])->name('hdebug');


/*
Route::get('/dashboard', function () {
    return Inertia::render('Dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

*/

require __DIR__.'/auth.php';


Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});
