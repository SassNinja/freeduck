package ch.cyberduck.binding.foundation;

/*
 * Copyright (c) 2002-2025 iterate GmbH. All rights reserved.
 * https://cyberduck.io/
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 */

import org.junit.Test;

public class NSFileManagerTest {

    @Test
    public void testContainerURLForSecurityApplicationGroupIdentifier() {
        // Unsigned builds do not provision an application group; the API may return nil.
        NSFileManager.defaultManager().containerURLForSecurityApplicationGroupIdentifier("FREEDUCK00.freeduck");
    }
}