class Contact < ApplicationRecord
    belongs_to :kind, optional: true

    # def author
    #     "Raphael Molina"
    # end

    # def kind_description
    #     self.kind.description
    # end

    # def as_json(options={})
    #     super(
    #         methods: [:kind_description, :author], 
    #         root: true,
    #         include: { kind: {only: :description}}
    #     )
    # end

    # def hello
    #     I18n.t('hello')
    # end

    # def i18n
    #     I18n.default_locale 
    # end

    def birthdate_br
        I18n.l(self.birthdate) unless self.birthdate.blank?
    end

    def to_br
        {
            name: self.name,
            email: self.email,
            birthdate: (I18n.l(self.birthdate) unless self.birthdate.blank?)
        }
    end
end
