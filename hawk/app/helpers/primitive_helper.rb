# Copyright (c) 2009-2015 Tim Serong <tserong@suse.com>
# See COPYING for license.

module PrimitiveHelper
  def primitive_template_options(selected)
    options = ::Template.ordered.map do |template|
      [
        template.id,
        template.id,
        data: {
          clazz: template.clazz,
          provider: template.provider,
          type: template.type
        }
      ]
    end

    options_for_select(
      options,
      selected
    )
  end

  def primitive_clazz_options(selected)
    options = [].tap do |result|
      ::Primitive.options.each do |clazz, providers|
        next if clazz.empty?

        result.push [
          clazz,
          clazz
        ]
      end
    end

    options_for_select(
      options,
      selected
    )
  end

  def primitive_provider_options(selected)
    options = [].tap do |result|
      ::Primitive.options.each do |clazz, providers|
        providers.each do |provider, types|
          next if provider.empty?

          result.push [
            provider,
            provider,
            data: {
              clazz: clazz
            }
          ]
        end
      end
    end

    options_for_select(
      options,
      selected
    )
  end

  def primitive_type_options(selected)
    options = [].tap do |result|
      ::Primitive.options.each do |clazz, providers|
        providers.each do |provider, types|
          types.each do |type|
            next if type.empty?

            result.push [
              type,
              type,
              data: {
                clazz: clazz,
                provider: provider
              }
            ]
          end
        end
      end
    end

    options_for_select(
      options,
      selected
    )
  end
end
