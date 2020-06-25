
<?php ob_start(); ?>

<h1>Profil</h1>
<div>
    <form>
        <div>
            <label>Modifier mot de passe:</label>
            <input>
        </div>
        <div>
            <label>Modifier mon adresse mail:</label>
            <input>
        </div>
        <div>
            <input type="submit" value="Valider">
        </div>

    </form>



</div>



<?php $content = ob_get_clean(); ?>

<?php require('dashboard.php'); ?>
