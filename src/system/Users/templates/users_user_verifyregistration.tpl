{gt text='Enter verification code' assign='templatetitle'}
{modulelinks modname='Users' type='user'}
{include file='users_user_menu.tpl'}

{if !empty($errormessages)}
<div id="users_errormessages_div" class="z-errormsg">
    <p>Please correct the following items:</p>
    <ul id="users_errormessages">
        {foreach from=$errormessages item='message'}
        <li>{$message}</li>
        {/foreach}
    </ul>
</div>
{/if}

<form class="z-form" action="{modurl modname='Users' type='user' func='verifyRegistration'}" method="post">
    <div>
        <input type="hidden" id="users_authid" name="verifyauthid" value="{insert name='generateauthkey' module='Users'}" />
        <input type="hidden" id="users_setpass" name="setpass" value="{$setpass}" />
        <fieldset>
            <legend>{gt text='Verification code'}</legend>
            <p class="z-informationmsg">{gt text="Please enter your user name and the verification code you received."}</p>
            <input type="hidden" id="lostpasswordauthid" name="authid" value="{insert name='generateauthkey' module='Users'}" />
            <div class="z-formrow">
                <label for="users_uname">{gt text='User name'}</label>
                <input id="users_uname" type="text" name="uname" size="25" maxlength="25" value="{$verify_uname}" />
            </div>
            <div class="z-formrow">
                <label for="users_verifycode">{gt text='Verification code'}</label>
                <input id="users_verifycode" type="text" name="verifycode" size="5" maxlength="6" value="{$verifycode}" />
            </div>
        </fieldset>
        {if $setpass}
        <fieldset>
            <legend>{gt text='Create a password'}</legend>
            <p class="z-informationmsg">{gt text='You must establish a password for your account before the verification process is complete.'}</p>
            <div class="z-formrow">
                <label for="users_newpass">{gt text='Password'}</label>
                <input id="users_newpass" type="password" name="newpass" size="25" maxlength="60" value="" />
                {if $modvars.Users.use_password_strength_meter eq 1}
                {pageaddvar name='javascript' value='prototype'}
                {pageaddvar name='javascript' value='system/Users/javascript/Zikula.Users.PassMeter.js'}

                <script type="text/javascript">
                    var passmeter = new Zikula.Users.PassMeter('users_newpass',{
                        username:'users_uname',
                        minLength: '{{$modvars.Users.minpass}}',
                        messages: {
                            username: '{{gt text="Password can not match the username, choose a different password."}}',
                            minLength: '{{gt text="The minimum length for user passwords is %s characters." tag1=$modvars.Users.minpass}}'
                        },
                        verdicts: [
                        '{{gt text="Weak"}}',
                        '{{gt text="Normal"}}',
                        '{{gt text="Strong"}}',
                        '{{gt text="Very Strong"}}'
                        ]
                    });
                </script>
                {/if}
            </div>
            <div class="z-formrow">
                <label for="users_newpassagain">{gt text='Password (repeat for verification)'}</label>
                <input id="users_newpassagain" type="password" name="newpassagain" size="25" maxlength="60" value="" />
            </div>
            <div class="z-formrow">
                <label for="users_newpassreminder">{gt text='Password reminder'}</label>
                <input id="users_newpassreminder" type="text" name="newpassreminder" size="25" maxlength="128" value="{$newpassreminder}" />
                <div class="z-sub z-formnote">{gt text="Enter a word or a phrase that will remind you of your password."}</div>
                <div class="z-formnote z-informationmsg">{gt text="Notice: Do not use a word or phrase that will allow others to guess your password! Do not include your password or any part of your password here!"}</div>
            </div>
        </fieldset>
        {/if}
        <div class="z-formbuttons z-buttons">
            {button src='button_ok.gif' set='icons/extrasmall' __alt='Submit' __title='Submit' __text='Submit'}
            <a href="{homepage|safetext}" title="{gt text='Cancel'}">{img id='users_cancel' modname='core' set='icons/extrasmall' src='button_cancel.gif' __alt='Cancel' __title='Cancel'} {gt text='Cancel'}</a>
        </div>
    </div>
</form>
