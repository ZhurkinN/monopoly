package com.game.monopoly.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Accessors(chain = true)
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Table(name = "chance_card")
public class ChanceCard {
    @Id
    private Long id;

    @Column(name = "description")
    private String description;

    @Column(name = "image")
    private String image;

    @Column(name = "money_difference")
    private Long moneyDifference;

    @Column(name = "step")
    private Long step;
}
