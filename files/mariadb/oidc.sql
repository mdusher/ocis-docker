CREATE TABLE oidc_migration_versions (version VARCHAR(191) PRIMARY KEY NOT NULL);
INSERT INTO oidc_migration_versions VALUES('20180305180300');
INSERT INTO oidc_migration_versions VALUES('20180425203400');
INSERT INTO oidc_migration_versions VALUES('20200517071100');
INSERT INTO oidc_migration_versions VALUES('20200901163000');
INSERT INTO oidc_migration_versions VALUES('20210714113000');
INSERT INTO oidc_migration_versions VALUES('20210823141300');
INSERT INTO oidc_migration_versions VALUES('20210827111300');
INSERT INTO oidc_migration_versions VALUES('20210902113500');
INSERT INTO oidc_migration_versions VALUES('20210908143500');
INSERT INTO oidc_migration_versions VALUES('20210916153400');
INSERT INTO oidc_migration_versions VALUES('20210916173400');
CREATE TABLE oidc_user (
            id VARCHAR(191) PRIMARY KEY NOT NULL,
            claims TEXT,
            updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
            created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
        );
CREATE TABLE oidc_client (
            id VARCHAR(191) PRIMARY KEY NOT NULL,
            secret VARCHAR(255) NOT NULL,
            name VARCHAR(255) NOT NULL,
            description VARCHAR(255) NOT NULL,
            auth_source VARCHAR(255),
            redirect_uri TEXT NOT NULL,
            scopes TEXT NOT NULL,
            is_enabled BOOLEAN NOT NULL DEFAULT true,
            is_confidential BOOLEAN NOT NULL DEFAULT false,
            owner VARCHAR(191) NULL,
            post_logout_redirect_uri TEXT NULL,
            backchannel_logout_uri TEXT NULL
);
-- Used 'httpd' host for back-channel logout url (https://httpd:8443/test/a/simplesamlphp-module-oidc/backchannel_logout)
-- since this is the hostname of conformance server while running in container environment
INSERT INTO oidc_client VALUES('web','web','ownCloud web',replace('ownCloud web\n','\n',char(10)),'devidp','["https:\/\/ocis.owncloud.test\/","https:\/\/ocis.owncloud.test\/oidc-callback.html","https:\/\/ocis.owncloud.test\/oidc-silent-redirect.html"]','["openid","profile","email"]',1,0,NULL,NULL,NULL);
INSERT INTO oidc_client VALUES('mxd5OQDk6es5LzOzRvidJNfXLUZS2oN3oUFeXPP8LpPrhx3UroJFduGEYIBOxkY1','KFeFWWEZO9TkisIQzR3fo7hfiMXlOpaqP8CFuTbSHzV1TUuGECglPxpiVKJfOXIx','ownCloud iOS app',replace('ownCloud iOS app\n','\n',char(10)),'devidp','["oc:\/\/ios.owncloud.com","oc.ios:\/\/ios.owncloud.com"]','["openid","profile","email"]',1,1,NULL,NULL,NULL);
INSERT INTO oidc_client VALUES('e4rAsNUSIUs0lF4nbv9FmCeUkTlV9GdgTLDH1b5uie7syb90SzEVrbN7HIpmWJeD','dInFYGV33xKzhbRmpqQltYNdfLdJIfJ9L5ISoKhNoT9qZftpdWSP71VrpGR9pmoD','ownCloud Android app',replace('ownCloud Android app\n','\n',char(10)),'devidp','["oc:\/\/android.owncloud.com"]','["openid","profile","email"]',1,1,NULL,NULL,NULL);
INSERT INTO oidc_client VALUES('xdXOt13JKxym1B1QcEncf2XDkLAexMBFwiT9j6EfhhHFJhs2KM9jbjTmf8JBXE69','UBntmLjC2yYCeHwsyj73Uwo9TAaecAetRwMw0xYcvNL9yRdLSUi0hUAHfvCHFeFh','ownCloud desktop client',replace('ownCloud desktop client\n','\n',char(10)),'devidp','["http:\/\/127.0.0.1:*","http://localhost:*"]','["openid","profile","email"]',1,1,NULL,NULL,NULL);


CREATE TABLE oidc_access_token (
            id VARCHAR(191) PRIMARY KEY NOT NULL,
            scopes TEXT,
            expires_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
            user_id VARCHAR(191) NOT NULL,                          
            client_id VARCHAR(191) NOT NULL,
            is_revoked BOOLEAN NOT NULL DEFAULT false,
            auth_code_id varchar(191) DEFAULT NULL, requested_claims TEXT NULL,
            CONSTRAINT FK_43C1650EA76ED395 FOREIGN KEY (user_id) 
                REFERENCES oidc_user (id) ON DELETE CASCADE,                                 
            CONSTRAINT FK_43C1650E19EB6921 FOREIGN KEY (client_id) 
                REFERENCES oidc_client (id) ON DELETE CASCADE                                
        );
CREATE TABLE oidc_refresh_token (
            id VARCHAR(191) PRIMARY KEY NOT NULL,          
            expires_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
            access_token_id VARCHAR(191) NOT NULL,
            is_revoked BOOLEAN NOT NULL DEFAULT false,
            auth_code_id varchar(191) DEFAULT NULL,
            CONSTRAINT FK_636B86402CCB2688 FOREIGN KEY (access_token_id)
                REFERENCES oidc_access_token (id) ON DELETE CASCADE
        );
CREATE TABLE oidc_auth_code (
            id VARCHAR(191) PRIMARY KEY NOT NULL,
            scopes TEXT,
            expires_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
            user_id VARCHAR(191) NOT NULL,                          
            client_id VARCHAR(191) NOT NULL,
            is_revoked BOOLEAN NOT NULL DEFAULT false,
            redirect_uri TEXT NOT NULL, nonce TEXT NULL,
            CONSTRAINT FK_97D32CA7A76ED395 FOREIGN KEY (user_id)
                REFERENCES oidc_user (id) ON DELETE CASCADE,                                 
            CONSTRAINT FK_97D32CA719EB6921 FOREIGN KEY (client_id)
                REFERENCES oidc_client (id) ON DELETE CASCADE                                            
        );
CREATE TABLE oidc_allowed_origin (
            client_id varchar(191) NOT NULL,
            origin varchar(191) NOT NULL,
            PRIMARY KEY (client_id, origin),
            CONSTRAINT FK_A027AF1E19EB6921 FOREIGN KEY (client_id)
                REFERENCES oidc_client (id) ON DELETE CASCADE
        );
CREATE TABLE oidc_session_logout_ticket (
           sid VARCHAR(191) NOT NULL,
           created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);