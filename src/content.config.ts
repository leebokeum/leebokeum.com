import { defineCollection, z } from 'astro:content';
import { glob } from 'astro/loaders';

const blog = defineCollection({
    loader: glob({ pattern: '**/*.md', base: './src/content/blog' }),
    schema: z.object({
        title: z.string(),
        date: z.coerce.date(),
        category: z.string(),
        tags: z.array(z.string()).default([]),
        author: z.string().default('이복음'),
        subTitle: z.string().default(''),
        repImg: z.string().nullable().default(null),
        hit: z.number().default(0),
        likes: z.number().default(0),
        legacyComments: z.array(z.object({
            author: z.string(),
            date: z.string(),
            body: z.string(),
        })).default([]),
    }),
});

export const collections = { blog };
