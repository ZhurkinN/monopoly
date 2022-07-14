ALTER TABLE card_state
    ADD CONSTRAINT fkfrkq9ico38b4507cs26rwq0m FOREIGN KEY (card_id)
        REFERENCES public.company_card (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION;

ALTER TABLE company_card_fines
    ADD CONSTRAINT fk62u3688renmwt2kbthi9ipgo4 FOREIGN KEY (fines_id)
        REFERENCES public.level_fine (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    ADD CONSTRAINT fkhy5gg124710e52oaiao9hekob FOREIGN KEY (company_card_id)
        REFERENCES public.company_card (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION;

ALTER TABLE session_card_states
    ADD CONSTRAINT fka3pf60wcev2ptm346e1bm81it FOREIGN KEY (session_id)
        REFERENCES public.session (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    ADD CONSTRAINT fkact41n2exbg84dedmurvq5c74 FOREIGN KEY (card_states_id)
        REFERENCES public.card_state (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION;

ALTER TABLE session_players
    ADD CONSTRAINT fk85g0pliqsmttp3t8iowxm4ncf FOREIGN KEY (session_id)
        REFERENCES public.session (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    ADD CONSTRAINT fkolt6486wq0lrc2rviyircpvts FOREIGN KEY (players_id)
        REFERENCES public.player (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION;

ALTER TABLE message
    ADD CONSTRAINT fk9992tve4h6d4oxhubkv2rpyyi FOREIGN KEY (receiver_id)
        REFERENCES public.player (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    ADD CONSTRAINT fkq8c774xf2sjl1oo3qbh1vusjf FOREIGN KEY (sender_id)
        REFERENCES public.player (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION;

ALTER TABLE session_messages
    ADD CONSTRAINT fkcmfjgtpdi72gvhlsinny3l2ex FOREIGN KEY (session_id)
        REFERENCES public.session (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    ADD CONSTRAINT fkk4884w1j91e1xtrluqk512bju FOREIGN KEY (messages_id)
        REFERENCES public.message (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION